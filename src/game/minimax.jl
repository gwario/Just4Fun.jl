"""
alignment_value_for(spec::Just4FunSpec, g::Just4FunEnv, player::Player, alignment)::Float32

Retruns a metric for degree of completeness of one winning position.
"""
function alignment_value_for(spec::Just4FunSpec, g::Just4FunEnv, player::Player, alignment)::Float32
  γ = 0.1
  N = 0
  for pos in alignment
    field_stones = g.field_stones[pos[1], pos[2], :]
    if has_majority(field_stones, player) # for every cell with majority of an alignment, increase reward
      N += 1
    elseif dominated(field_stones, player) # if one cell of an alignment is dominated by another player
      return 0.
    end
  end
  return γ ^ (spec.settings.board.length_win - 1 - N)
end


const Pos = Tuple{Int, Int}
const Alignment = Vector{Pos}


"""
alignment_from(spec::Just4FunSpec, g::Just4FunEnv, pos, dir)::Union{Alignment, Nothing}
"""
function alignment_from(spec::Just4FunSpec, g::Just4FunEnv, pos, dir)::Union{Alignment, Nothing}
  al = Alignment()
  for _ in 1:spec.settings.board.length_win
    valid_pos(spec, pos) || (return nothing)
    push!(al, pos)
    pos = pos .+ dir
  end
  return al
end

"""
alignments_with(spec::Just4FunSpec, g::Just4FunEnv, dir)::Vector{Alignment}
"""
function alignments_with(spec::Just4FunSpec, g::Just4FunEnv, dir)::Vector{Alignment}
  x_len, y_len = size(spec.settings.board.value_distribution)
  als = [alignment_from(spec, g, (x, y), dir) for x in 1:x_len for y in 1:y_len]
  filter(al -> !isnothing(al), als)
end


"""
heuristic_value_for(spec::Just4FunSpec, g::Just4FunEnv, player::Player)

Retruns a metric for degree of completeness of all winning positions.
"""
function heuristic_value_for(spec::Just4FunSpec, g::Just4FunEnv, player::Player)
  ret = sum(
    alignment_value_for(spec, g, player, al) for al in [
      alignments_with(spec, g, (1,  1));
      alignments_with(spec, g, (1, -1));
      alignments_with(spec, g, (0,  1));
      alignments_with(spec, g, (1,  0))
    ]
  )
  return ret
end

"""
GI.heuristic_value(g::Just4FunEnv)

Return a heuristic estimate of the state value for the current player.
The given state must be nonfinal and returned values must belong to the (-∞, ∞) interval.
This function is not needed by AlphaZero but it is useful for building baselines such as minmax players.
"""
function GI.heuristic_value(g::Just4FunEnv)
  spec = GI.spec(g)
  mine = heuristic_value_for(spec, g, g.curplayer)
  yours = heuristic_value_for(spec, g, next_player(spec, g.curplayer))
  return Float64(mine - yours)
end
