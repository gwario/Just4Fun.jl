using AlphaZero: Log

const STATE_BORDER_H = "─" # "═"
const STATE_BORDER_V = "│" # "║"
const STATE_BORDER_L_MID = "├" # "╠"
const STATE_BORDER_R_MID = "┤" # "╣"
const STATE_BORDER_T_MID = "┬" # "╦"
const STATE_BORDER_B_MID = "┴" # "╩"
const STATE_BORDER_MID = "┼" # "╬"
const STATE_BORDER_T_R = "┐" # "╗"
const STATE_BORDER_T_L = "┌" # "╔"
const STATE_BORDER_B_R = "┘" # "╝"
const STATE_BORDER_B_L = "└" # "╚"

player_color_slug(p::Player) =
  p == YELLOW  ? "Y" :
  p == RED     ? "R" :
  p == MAGENTA ? "M" :
                 "G"

"""
log_upper_border(logger::Log.Logger, spec::Just4FunSpec)
"""
function log_upper_border(logger::Log.Logger, spec::Just4FunSpec)
  border = repeat(STATE_BORDER_H, spec.settings.players * 2 + spec.settings.players - 1)
  _, len_x = size(spec.settings.board.value_distribution)
  temp_str = ""
  for x in 1:len_x
    if x == 1
      temp_str *= STATE_BORDER_T_L * border * STATE_BORDER_T_MID
    elseif x == len_x
      temp_str *= border * STATE_BORDER_T_R
    else
      temp_str *= border * STATE_BORDER_T_MID
    end
  end
  Log.print(logger, temp_str)
end

"""
log_lower_border(logger::Log.Logger, spec::Just4FunSpec)
"""
function log_lower_border(logger::Log.Logger, spec::Just4FunSpec)
  _, len_x = size(spec.settings.board.value_distribution)
  border = repeat(STATE_BORDER_H, spec.settings.players * 2 + spec.settings.players - 1)
  temp_str = ""
  for x in 1:len_x
    if x == 1
      temp_str *= STATE_BORDER_B_L * border * STATE_BORDER_B_MID
    elseif x == len_x
      temp_str *= border * STATE_BORDER_B_R
    else
      temp_str *= border * STATE_BORDER_B_MID
    end
  end
  Log.print(logger, temp_str)
end

"""
log_middle_border(logger::Log.Logger, spec::Just4FunSpec)
"""
function log_middle_border(logger::Log.Logger, spec::Just4FunSpec)
  _, len_x = size(spec.settings.board.value_distribution)
  border = repeat(STATE_BORDER_H, spec.settings.players * 2 + spec.settings.players - 1)
  temp_str = ""
  for x in 1:len_x
    if x == 1
      temp_str *= STATE_BORDER_L_MID * border * STATE_BORDER_MID
    elseif x == len_x
      temp_str *= border * STATE_BORDER_R_MID
    else
      temp_str *= border * STATE_BORDER_MID
    end
  end
  Log.print(logger, temp_str)
end

"""
log_cell(logger::Log.Logger, spec::Just4FunSpec, s::Just4FunEnvState, y::Int64)
"""
function log_cell(logger::Log.Logger, spec::Just4FunSpec, s::Just4FunEnvState, y::Int64)
  _, len_x = size(spec.settings.board.value_distribution)
  # cell id row
  temp_str = ""
  for x in 1:len_x
    temp_str *= (x == 1 ? STATE_BORDER_V : "")
    temp_str *= padded(string(spec.settings.board.value_distribution[y, x]))
    temp_str *= " "
    temp_str *= "  " ^ (spec.settings.players - 1)
    temp_str *= STATE_BORDER_V
  end
  Log.print(logger, temp_str)

  # player stones row
  temp_str = ""
  for x in 1:len_x
    pos = (x, y)
    temp_str *= (x == 1 ? STATE_BORDER_V : "")
    for p in 1:spec.settings.players
      #temp_str *= padded(player_stones(s.field_stones, pos, Player(p)))
      #temp_str *= padded("$(p % 2 == 0 ? "\u0332" : "")$(player_stones(s.field_stones, pos, Player(p)))")
      stones = player_stones(s.field_stones, pos, Player(p))
      temp_str *= padded("$(stones > 0 ? "$stones" : "")")
      temp_str *= (p != spec.settings.players ? " " : "")
    end
    temp_str *= STATE_BORDER_V
  end
  Log.print(logger, temp_str)
end

"""
get_points_info(spec::Just4FunSpec, s::Just4FunEnvState)::Tuple{Vector{FieldValue}, Vector{FieldValue}}
Returns the points info (sum of fields with majority and the highest
field with majority) of each player.
"""
function get_points_info(spec::Just4FunSpec, s::Just4FunEnvState)::Tuple{Vector{FieldValue}, Vector{FieldValue}}
  players = map(p_i -> Player(p_i), range(Just4Fun.YELLOW, length=spec.settings.players))
  points = zeros(UInt8, spec.settings.players)
  max_field_points = zeros(UInt8, spec.settings.players)

  for field_value in spec.settings.board.value_distribution
    player_stones = get_stones(spec, s, field_value)
    field_points = [has_majority(player_stones, player) ? field_value : 0x0 for player in players]
    max_field_points = [max(max_field_points[to_index(player)], field_points[to_index(player)]) for player in players]
    points .+= field_points
  end
  (points, max_field_points)
end

"""
get_stones(spec::Just4FunSpec, s::Just4FunEnvState, field_value::FieldValue)::AbstractVector{Stones}

Returns the vector of stones on a field.
"""
function get_stones(spec::Just4FunSpec, s::Just4FunEnvState, field_value::Int)::AbstractVector{Stones}
  # TODO make a map field value to index
  field_index = findfirst(isequal(field_value), spec.settings.board.value_distribution)
  player_stones = s.field_stones[field_index[1], field_index[2], :]
  return player_stones
end

"""
log_playercards_stones_points_max_field(logger::Log.Logger, spec::Just4FunSpec, s::Just4FunEnvState)

Prints all players' cards.
"""
function log_playercards_stones_points_max_field(logger::Log.Logger, spec::Just4FunSpec, s::Just4FunEnvState, player_names::Vector{String})
  points, max_field_points = get_points_info(spec, s)
    
  for player_index in range(YELLOW; length=spec.settings.players)
    player = Player(player_index)
    
    name_str = string(player_names[player_index], "(", player_color_slug(player), ")")
    stones_str = "$(convert(Int64, s.player_stones[player_index]))"
    sum_str = "$(convert(Int64, points[player_index]))"
    max_str = "$(convert(Int64, max_field_points[player_index]))"
    composed_hand_str = !isnothing(spec.settings.cards) ? "'s hand: $(join(sort(convert(Array{Int64}, playercards(s, player))), " "))" : ""
    Log.print(logger, "$name_str$composed_hand_str ($stones_str stones) ($sum_str points) (max field is $max_str) $(player == s.curplayer ? "(it's turn)" : "")")
  end
  if !isnothing(spec.settings.cards)
    log_gamecards(logger, s)
    log_used_cards(logger, s)
  end
end

"""
log_gamecards(logger::Log.Logger, s::Just4FunEnvState)

Prints the game cards (the not yet dealt cards)
"""
function log_gamecards(logger::Log.Logger, s::Just4FunEnvState)
  Log.print(logger, string("Stack: ^ ", join(convert(Vector{Int64}, reverse(collect(Iterators.reverse(s.stack)))), " "), " \$"))
end

"""
log_used_cards(logger::Log.Logger, s::Just4FunEnvState)

Prints the used cards.
"""
function log_used_cards(logger::Log.Logger, s::Just4FunEnvState)
  cards = sort(s.used_cards)
  Log.print(logger, string("Pile: ", join(convert(Vector{Int64}, cards), " ")))
end

const cfield     = Log.ColType(nothing, a -> a isa CardsAction ? "$(Int64(a.value))"                    : "$(Int64(a))")
const ccards     = Log.ColType(nothing, a -> a isa CardsAction ? "$(join(Vector{Int64}(a.cards), " "))" : "-")
const cprob      = Log.ColType(nothing, x -> fmt(".1f", 100 * x) * "%")
const cprob_fine = Log.ColType(nothing, x -> fmt(".3f", 100 * x) * "%")
const cval       = Log.ColType(nothing, x -> fmt("+.2f", x))
  

"""
log_action(logger::Log.Logger, player::Player, player_names::Vector{String}, field_values::Vector{FieldValue}, pre_temperature_policy::Vector{Float64}, sample_policy::Vector{Float64}, available_actions::Vector{Action}, action::Action)
"""
function log_action(logger::Log.Logger, player::Player, player_names::Vector{String},
  field_values::Vector{FieldValue}, pre_temperature_policy::Vector{Float64}, sample_policy::Vector{Float64}, available_actions::Vector{Action}, action::Action)
  name_str = string(player_names[Int64(player)], "(", player_color_slug(player), ")")
  action_str = string(
    "Field ",
    action isa CardsAction ? "$(Int64(action.value)) "                            : "$(Int64(action))",
    action isa CardsAction ? "(cards: $(join(Vector{Int64}(action.cards), " ")))" : ""
  )
  Log.print(logger, "$name_str played $action_str")
  atable = Log.Table([
    ("field",        cfield, r -> r[1]),
    ("cards",        ccards, r -> r[1]),
    ("policy",       cprob,  r -> r[2]),
    ("policy+temp.", cprob,  r -> r[3])
  ])

  action_value_actions_meta = Dict{Int64, Tuple{Vector{Action}, Vector{Float64}, Vector{Float64}}}()
  for (available_action, pre_temperature_proba, sample_proba) in zip(available_actions, pre_temperature_policy, sample_policy)
    available_action_value = available_action isa CardsAction ? available_action.value : available_action
    if !haskey(action_value_actions_meta, available_action_value)
      action_value_actions_meta[available_action_value] = (Vector{Action}([available_action]), Vector{Float64}([pre_temperature_proba]), Vector{Float64}([sample_proba]))
    else
      push!(action_value_actions_meta[available_action_value][1], available_action)
      push!(action_value_actions_meta[available_action_value][2], pre_temperature_proba)
      push!(action_value_actions_meta[available_action_value][3], sample_proba)
    end
  end

  data = []
  for field_value in field_values
    if haskey(action_value_actions_meta, field_value)
      # add for this field value all the available actions
      actions, pre_temperature_probas, sample_probas = action_value_actions_meta[field_value]
      for (a, pre_temperature_proba, sample_proba) in zip(actions, pre_temperature_probas, sample_probas)
        @assert field_value == to_field_value(a)
        push!(data, (a, pre_temperature_proba, sample_proba))
      end
    else
      # still add the field value but without cards
      push!(data, (
        CardsAction((value=field_value, cards=Cards())),
        0.0, 0.0
      ))
    end
  end
  Log.table(logger, atable, sort(data, rev=false, by=r -> to_field_value(r[1])))
end

"""
log_action(logger::Log.Logger, player::Player, player_names::Vector{String}, pre_mask_policy::Vector{Float64}, mask_policy::Vector{Float64}, value::Float64, pre_temperature_policy::Vector{Float64}, sample_policy::Vector{Float64}, available_board_indices::Vector{Int64}, available_actions::Vector{Action}, action::Action)
"""
function log_action(
  logger::Log.Logger, player::Player, player_names::Vector{String},
  nn_output_field_value_mapping::Vector{FieldValue}, pre_mask_policy::Vector{Float64}, mask_policy::Vector{Float64}, value::Float64,
  pre_temperature_policy::Vector{Float64}, sample_policy::Vector{Float64}, available_board_indices::Vector{Int64}, available_actions::Vector{Action}, action::Action)
  name_str = string(player_names[Int64(player)], "(", player_color_slug(player), ")")
  action_str = string(
    "Field ",
    action isa CardsAction ? "$(Int64(action.value)) "                            : "$(Int64(action))",
    action isa CardsAction ? "(cards: $(join(Vector{Int64}(action.cards), " ")))" : ""
  )
  Log.print(logger, "$name_str played $action_str")
  ntable = Log.Table([
    ("field",        cfield, r -> r[1]),
    ("cards",        ccards, r -> r[1]),
    ("rPnet",        cprob_fine, r -> r[2]),
    ("mPnet",        cprob_fine, r -> r[3]),
    ("Vnet",         cval,       r -> r[4]),
    ("policy",       cprob,  r -> r[5]),
    ("policy+temp.", cprob,  r -> r[6])
  ])

  action_nn_index_actions_meta = Dict{Int64, Tuple{Vector{Action}, Vector{Float64}, Vector{Float64}}}()
  for (action_nn_idx, available_action, pre_temperature_proba, sample_proba) in zip(available_board_indices, available_actions, pre_temperature_policy, sample_policy)
    if !haskey(action_nn_index_actions_meta, action_nn_idx)
      action_nn_index_actions_meta[action_nn_idx] = (Vector{Action}([available_action]), Vector{Float64}([pre_temperature_proba]), Vector{Float64}([sample_proba]))
    else
      push!(action_nn_index_actions_meta[action_nn_idx][1], available_action)
      push!(action_nn_index_actions_meta[action_nn_idx][2], pre_temperature_proba)
      push!(action_nn_index_actions_meta[action_nn_idx][3], sample_proba)
    end
  end

  data = []
  for (nn_output_idx, field_value) in enumerate(nn_output_field_value_mapping)
    if haskey(action_nn_index_actions_meta, nn_output_idx)
      # add for this field value all the available actions
      actions, pre_temperature_probas, sample_probas = action_nn_index_actions_meta[nn_output_idx]
      for (a, pre_temperature_proba, sample_proba) in zip(actions, pre_temperature_probas, sample_probas)
        @assert field_value == to_field_value(a)
        push!(data, (a, pre_mask_policy[nn_output_idx], mask_policy[nn_output_idx], value, pre_temperature_proba, sample_proba))
      end
    else
      # still add the field value but without cards
      push!(data, (
        CardsAction((value=field_value, cards=Cards())),
        pre_mask_policy[nn_output_idx], mask_policy[nn_output_idx], value,
        0.0, 0.0
      ))
    end
  end
  # temp + sample policies is w.r. available_actions, nw related policies are w.r. NN_OUTPUT_MAPPING...
  Log.table(logger, ntable, sort(data, rev=false, by=r -> to_field_value(r[1])))
end


"""
log_winner_result(logger::Log.Logger, s::Just4FunEnvState, player_names::Vector{String})

Prints the winner or draw notice.
"""
function log_winner_result(logger::Log.Logger, s::Just4FunEnvState, player_names::Vector{String})
  if s.winner != Player(0)
    Log.print(logger, "$(player_names[Just4Fun.to_index(s.winner)])($(player_name(s.winner))) has won $(s.state)!")
  elseif iszero(s.player_stones)
    Log.print(logger, "It's a draw!")
  end
end

"""
log_state(logger::Log.Logger, spec::Just4FunSpec, state. player_names::Vector{String})
Print the game state on the standard output.
"""
function log_state(logger::Log.Logger, spec::Just4FunSpec, state, player_names::Vector{String})
    len_y, _ = size(spec.settings.board.value_distribution)
    for y in 1:len_y
        if y == 1
            log_upper_border(logger, spec)
        end
        log_cell(logger, spec, state, y)
        if y < len_y
          log_middle_border(logger, spec)
        else
          log_lower_border(logger, spec)
        end  
    end
    log_playercards_stones_points_max_field(logger, spec, state, player_names)
end
