"""
has_majority(field_stones::SVector{NUM_PLAYERS, Stones}, player::Player)::Bool

Retruns true if player p is in the majority over all other players in this field.
"""
function has_majority(field_stones::SVector{NUM_PLAYERS, Stones}, player::Player)::Bool
  player_index = to_index(player)
  player_stones = field_stones[player_index]
  other_players_stones = [field_stones[i] for i in 1:length(field_stones) if i != player_index]
  ret = all(map(others_stones -> others_stones < player_stones, other_players_stones))
  return ret
end

"""
has_minority(field_stones::SVector{NUM_PLAYERS, Stones}, player::Player)::Bool

Retruns true if player p is in the minority over at least one other players in this field.
"""
function has_minority(field_stones::SVector{NUM_PLAYERS, Stones}, player::Player)::Bool
  player_index = to_index(player)
  player_stones = field_stones[player_index]
  other_players_stones = [field_stones[i] for i in 1:length(field_stones) if i != player_index]
  ret = any(map(others_stones -> others_stones > player_stones, other_players_stones))
  return ret
end

"""
dominated(field_stones::SVector{NUM_PLAYERS, Stones}, player::Player)::Bool

Retruns true if player p is dominated by another player in this cell.
"""
function dominated(field_stones::SVector{NUM_PLAYERS, Stones}, player::Player)::Bool
  player_index = to_index(player)
  player_stones = field_stones[player_index]
  other_players_stones = [field_stones[i] for i in 1:length(field_stones) if i != player_index]
  ret = any(map(others_stones -> others_stones - 1 > player_stones, other_players_stones))
  return ret
end

"""
dominant_player(field_stones::SVector{NUM_PLAYERS, Stones})::Union{Player,Nothing}

Retruns the player who is dominant in this field or nothing if there is none.
"""
function dominant_player(field_stones::SVector{NUM_PLAYERS, Stones})::Union{Player,Nothing}
  max, max_index = findmax(field_stones)
  other_players_stones = [field_stones[i] for i in 1:length(field_stones) if i != max_index]
  if all(map(value -> value <= max - 2, other_players_stones))
    res = Player(max_index)
  else
    res = nothing
  end
  return res
end

"""
is_available(field_stones::SVector{NUM_PLAYERS, Stones}, player::Player)::Bool

Returns true if the field is available for player, i.e. if player is not already
dominating the the opponents and the opponents do not dominate the field.
"""
function is_available(field_stones::SVector{NUM_PLAYERS, Stones}, player::Player)::Bool
  return !dominated(field_stones, player) && !dominating(field_stones, player)
end

"""
fields_reachability(player_cards::SMatrix{SIZE_HAND, NUM_PLAYERS, CardValue}, player::Player)::Array{Float32}

Returns an array with values true, if the respective field is reachable with a player's hand.
"""
function fields_reachability(all_player_cards::SMatrix{SIZE_HAND, NUM_PLAYERS, CardValue}, player::Player)::Array{Float32}
  player_cards = all_player_cards[1:SIZE_HAND, to_index(player)]
  player_card_combinations = regular_combinations(FIELD_VALUES, SVector{SIZE_HAND, CardValue}(player_cards))
  values = unique(map(cc -> sum(cc), player_card_combinations))
  field_array = zeros(Float32, SIDE_LENGTH, SIDE_LENGTH)
  for value in values
    positions = findall(isequal(value), FIELD_VALUES)
    for pos in positions
      field_array[pos] = 1.0
    end
  end
  return field_array
end


"""
dominating(field_stones::SVector{NUM_PLAYERS, Stones}, player::Player)::Bool

Retruns true if player p is dominating by another player in this cell.
"""
function dominating(field_stones::SVector{NUM_PLAYERS, Stones}, player::Player)::Bool
  is_dominating = player == dominant_player(field_stones)
  return is_dominating
end


"""
take_stone!(g::Just4FunEnv)

Removes a stone from the current players stash.
NOTE: replaces the immutable stones state
"""
function take_stone!(g::Just4FunEnv)
  player_index = to_index(g.curplayer)
  @assert(g.player_stones[player_index] > 0, "Player '$(g.curplayer)' has no stones left")
  g.player_stones = setindex(g.player_stones, Stones(g.player_stones[player_index] - 1), player_index)
end

"""
place_stone!(g::Just4FunEnv, field_index::Int64)

Increases the number of stones of the current player on the cell with index cell_index.
NOTE: replaces the immutable stones state
"""
function place_stone!(g::Just4FunEnv, field_value::FieldValue)
  spec = GI.spec(g)
  player_index = to_index(g.curplayer)
  field_index = findfirst(f -> f == field_value, FIELD_VALUES)
  player_field_index = CartesianIndex(field_index[1], field_index[2], player_index)

  new_curplayer_stones = g.field_stones[player_field_index] + 1
  
  g.field_stones = setindex(g.field_stones, new_curplayer_stones, player_field_index)
end

"""
get_stones(g::Just4FunEnv, field_value::FieldValue)::SVector{NUM_PLAYERS, Stones}

Returns the vector of stones on a field.
"""
function get_stones(g::Just4FunEnv, field_value::FieldValue)::SVector{NUM_PLAYERS, Stones}
  # TODO make a map field value to index
  field_index = findfirst(f -> f == field_value, FIELD_VALUES)
  player_stones = g.field_stones[field_index[1], field_index[2], :]
  return player_stones
end

"""
put_down!(g::Just4FunEnv, cards_to_put_down::Cards)

Removes the cards from the curplayercards and adds them to the usedcards.
NOTE: updates mutable states in place and replaces immutable ones
NOTE: Vectors are replaced not modified inplace! (!worked)
"""
function put_down!(g::Just4FunEnv, cards_to_put_down::Cards)
  @assert(0 <= length(cards_to_put_down) && length(cards_to_put_down) <= SIZE_HAND, "Trying to put down an invalid number of cards")
  player_index = to_index(g.curplayer)

  for card_to_put_down in cards_to_put_down
    # find the index of the card
    player_cards = g.player_cards[:, player_index]
    card_index = findfirst(card -> card == card_to_put_down, player_cards)
    @assert(!isnothing(card_index), "Trying to put down a card that's not in hand!")
    # remove it from player's hand
    g.player_cards = setindex(g.player_cards, CardValue(0), CartesianIndex(card_index, player_index))
    # add it to the usedcards
    g.used_cards = push!(copy(g.used_cards), card_to_put_down)
  end
end

"""
pick_cards!(g::Just4FunEnv, number::Int64)

Removes the cards from gamecards and adds them to the curplayercards.
NOTE: Vectors are replaced not modified inplace!
"""
function pick_cards!(g::Just4FunEnv, amount::Int64)
  @assert(1 <= amount && amount <= SIZE_HAND, "Trying to pick an invalid number of cards")
    
  curplayer_index = to_index(g.curplayer)
  
  for _ in 1:amount

    # shuffle used cards to create a new gamecards deck
    if isempty(g.stack)
      # @warn "Reshuffle used cards" # TODO: deactivated for performance, but might be interesting for statistics
      g.stack = shuffle(g.used_cards)
      g.used_cards = Cards()
    end
    # pick a card
    cp = copy(g.stack)
    picked_card = pop!(cp)
    g.stack = cp
    # add it to the player's hand
    # find first empty index
    empty_slot_index = findfirst(isequal(CardValue(0)), g.player_cards[:, curplayer_index])
    # put card at index
    g.player_cards = setindex(g.player_cards, picked_card, CartesianIndex(empty_slot_index, curplayer_index))
  end
end

"""
redraw(action::CardsAction)::Bool

Returns true if the given action is the redraw action.
"""
isredraw(action::CardsAction)::Bool = isempty(action.cards) && iszero(action.value)

"""
empty_field(player_stones::SVector)::Bool
Returns true if there are no stones on the cell
"""
empty_field(player_stones::SVector{NUM_PLAYERS, Stones})::Bool = sum(player_stones) == 0

"""
next_player(spec::Just4FunSpec, player::Player)::Player
Returns the next player in the order of play.
NOTET: Players are in ascending order from 1
"""
next_player(spec::Just4FunSpec, player::Player)::Player = 0x1 + (player % NUM_PLAYERS)

"""
previous_player(spec::Just4FunSpec, player::Player)::Player
Returns the previous player in the order of play.
NOTET: Players are in ascending order from 1
"""
previous_player(spec::Just4FunSpec, player::Player)::Player = next_player(spec, Player(player + NUM_PLAYERS - 0x2))

"""
is_curplayer_index(g::Just4FunEnv, player_index::Int64)::Bool

Retruns true if the index (of the cell) is the one of the curplayer.
"""
is_curplayer_index(g::Just4FunEnv, player_index::Int64)::Bool = to_index(g.curplayer) == player_index

"""
curplayercards(g::Just4FunEnv)::SVector{SIZE_HAND, CardValue}

Returns the current player's cards.
"""
curplayercards(g::Just4FunEnv)::SVector{SIZE_HAND, CardValue} = playercards(g, g.curplayer)

"""
playercards(g::Just4FunEnv, player::Player)::SVector{SIZE_HAND, CardValue}

Returns the player's cards.
"""
playercards(g::Just4FunEnv, player::Player)::SVector{SIZE_HAND, CardValue} = g.player_cards[1:SIZE_HAND, to_index(player)]

"""
playercards(s::Just4FunEnvState, player::Player)::Cards

Returns the player's cards.
"""
playercards(s::Just4FunEnvState, player::Player)::Cards = Cards(s.player_cards[:, to_index(player)])


"""
curplayerstones(g::Just4FunEnv)::Stones

Returns the current player's stones.
"""
curplayerstones(g::Just4FunEnv)::Stones = playerstones(g, g.curplayer)

"""
playerstones(g::Just4FunEnv, player::Player)::Stones

Returns the player's stones.
"""
playerstones(g::Just4FunEnv, player::Player)::Stones = g.player_stones[to_index(player)]

"""
valid_pos(field_values::SMatrix{SIDE_LENGTH, SIDE_LENGTH, FieldValue}, (col, row))

Returns true if the position specified by rown and column number,
is within the bounds of the board.
"""
function valid_pos(field_values::SMatrix{SIDE_LENGTH, SIDE_LENGTH, FieldValue}, (col, row))::Bool
  num_rows, num_cols = size(field_values)
  1 <= col <= num_cols && 1 <= row <= num_rows
end

"""
num_connected_dir(field_values::SMatrix{SIDE_LENGTH, SIDE_LENGTH, FieldValue}, field_stones::SArray{Tuple{SIDE_LENGTH, SIDE_LENGTH, NUM_PLAYERS}, Stones}, player::Player, field_value::FieldValue, dir)::Int64

Returns the number of field a player has the majoriy on in a direction.
 ___
/|\

NOTE: The field the action is pointing to is not counted!
"""
function num_connected_dir(field_values::SMatrix{SIDE_LENGTH, SIDE_LENGTH, FieldValue}, field_stones::SArray{Tuple{SIDE_LENGTH, SIDE_LENGTH, NUM_PLAYERS}, Stones}, player::Player, field_value::FieldValue, dir)::Int64
  #@assert field_stones[pos...] == player #TODO: reoplace with sensible?
  position = findfirst(isequal(field_value), field_values) # cartesian index
  p = Tuple(position) .+ dir
  n = 0
  while valid_pos(field_values, p) && has_majority(field_stones[p[1], p[2], :], player)
    n += 1
    p = p .+ dir
  end
  return n
end

"""
num_connected_axis(field_values::SMatrix{SIDE_LENGTH, SIDE_LENGTH, FieldValue}, field_stones::SArray{Tuple{SIDE_LENGTH, SIDE_LENGTH, NUM_PLAYERS}, Stones}, player::Player, field_value::FieldValue, axis)::Int64

__`|/__
  /|\

Returns the number of connected fields with majority from the point action is pointing to.
Does not include the point itself!
"""
function num_connected_axis(field_values::SMatrix{SIDE_LENGTH, SIDE_LENGTH, FieldValue}, field_stones::SArray{Tuple{SIDE_LENGTH, SIDE_LENGTH, NUM_PLAYERS}, Stones}, player::Player, field_value::FieldValue, axis)::Int64
  #@assert field_stones[pos...] == player #TODO: reoplace with sensible?
  num_after = num_connected_dir(field_values, field_stones, player, field_value, axis)
  num_before = num_connected_dir(field_values, field_stones, player, field_value, (0, 0) .- axis)
  return num_before + num_after
end

"""
winning_pattern_at(spec::Just4FunSpec, field_values::SMatrix{SIDE_LENGTH, SIDE_LENGTH, FieldValue}, field_stones::SArray{Tuple{SIDE_LENGTH, SIDE_LENGTH, NUM_PLAYERS}, Stones}, player::Player, field_value::FieldValue)::Bool

Returns true if the action caused a winning pattern to emerge.
"""
function winning_pattern_at(spec::Just4FunSpec, field_values::SMatrix{SIDE_LENGTH, SIDE_LENGTH, FieldValue}, field_stones::SArray{Tuple{SIDE_LENGTH, SIDE_LENGTH, NUM_PLAYERS}, Stones}, player::Player, field_value::FieldValue)::Bool
  position = findfirst(v -> v == field_value, field_values) # cartesian index
  players_stones = field_stones[position[1], position[2], :]
  num_at = has_majority(players_stones, player) ? 1 : 0

  if num_at == 1
    pattern_at = any(((1, 1), (1, -1), (1, 0), (0, 1))) do axis
      num_before_and_after = num_connected_axis(field_values, field_stones, player, field_value, axis)  
      num_before_and_after + num_at >= WIN_LENGTH
    end
  else
    pattern_at = false
  end
  return pattern_at
end

"""
update_action_mask!(g::Just4FunEnv)

Updates the action masks of all players.
"""
function update_action_mask!(g::Just4FunEnv)
  # reset all masks
  g.action_masks = falses(NUM_ACTIONS, NUM_PLAYERS)
  
  for player_index in range(YELLOW, length=NUM_PLAYERS)
    player = Player(player_index)
    if FEATURE_CARDS
      # get the possible cells according to combinations of the players cards
      player_cards = playercards(g, player)
      player_card_combinations = regular_combinations(FIELD_VALUES, player_cards)
      for player_card_combination in player_card_combinations
        field_value = convert(FieldValue, sum(player_card_combination))
        # FIXME: it must be here where the lookup fails
        mask_index = ACTION_ACTION_MASK_INDEX_MAP[(cards=player_card_combination, value=field_value)]
        field_stones = get_stones(g, field_value)
        available = is_available(field_stones, player) && (!FEATURE_MULTI_STONE ? empty_field(field_stones) : true)
        # update state
        setindex!(g.action_masks, available, CartesianIndex((mask_index, player_index)))
      end
      
      # if any card combination is possible: set redraw action false, otherwise true
      some_available = any(g.action_masks[:, player_index])
      redraw_mask_index = ACTION_ACTION_MASK_INDEX_MAP[(cards=Cards[], value=FieldValue(0))]
      setindex!(g.action_masks, !some_available, CartesianIndex((redraw_mask_index, player_index)))
    else
      actions = GI.actions(GI.spec(g))
      for (index, field_value) in enumerate(actions)
        field_stones = get_stones(g, field_value)
        available = !dominated(field_stones, player)
        # update state
        setindex!(g.action_masks, available, CartesianIndex((index, player_index)))
      end
    end
  end
end

"""
update_status!(g::Just4FunEnv, action::CardsAction)

Update the game status assuming g.curplayer just played action.
NOTE: seen as if the current player has just played action!
* action_masks
* finished (current player has won; no actions nor stones left for the next player)
* winner
"""
function update_status!(g::Just4FunEnv, action::CardsAction)
  spec = GI.spec(g)
  
  winner_by_goal = false
  winner_by_nums = false
  
  update_action_mask!(g)

  # Update winner and finished only if it was a regular action (otherwise those do not change)
  if !isredraw(action)

    field_value = FEATURE_CARDS ? action.value : action
  
    if winning_pattern_at(spec, FIELD_VALUES, g.field_stones, g.curplayer, field_value)
      #@atomic push!(Just4Fun.STATS.wins_by_pattern, 1)
      g.winner = g.curplayer
      g.state = end_by_pattern
      winner_by_goal = true
    end

    if !winner_by_goal
      # FIXME: no player has actions left - this can probably be dropped because there is probably no chance that no player will have any actions forever while still having stones becuase it would be a redraw over and over again but the cards would be reshuffled and even with 
      no_actions_available = iszero(sum(g.action_masks))
      no_stones_left = iszero(sum(g.player_stones))
      @assert !no_actions_available
      if no_stones_left
        g.winner, g.state = winner_by_numbers(spec, g)
        winner_by_nums = true
      end
    end

    if !winner_by_goal && !winner_by_nums
      g.winner = Player(0)
      g.state = in_progress
    end
  end
end

"""
update_status!(g::Just4FunEnv)
NOTE: seen as if the current player is about to play!
Update the game status:
* action_masks
* finished (any player has won; no actions nor stones left for the current player)
* winner
"""
function update_status!(g::Just4FunEnv)
  spec = GI.spec(g)

  winner_by_goal = false
  winner_by_nums = false
  
  update_action_mask!(g)
  
  # TODO: checking for the previous player might be sufficient
  # FIXME: performance improvements possible
  
  for player_index in range(Just4Fun.YELLOW, length=2)
    player = Player(player_index)
    for field_value in FIELD_VALUES
      if winning_pattern_at(spec, FIELD_VALUES, g.field_stones, player, field_value)
        #@atomic push!(Just4Fun.STATS.wins_by_pattern, 1)
        g.winner = player
        g.state = end_by_pattern
        winner_by_goal = true
        break
      end
    end
  end

  if !winner_by_goal
    # FIXME: no player has actions left - this can probably be dropped because there is probably no chance that no player will have any actions forever while still having stones becuase it would be a redraw over and over again but the cards would be reshuffled and even with 
    no_actions_available = iszero(sum(g.action_masks))
    no_stones_left = iszero(sum(g.player_stones))
    @assert !no_actions_available
    if no_stones_left
      g.winner, g.state = winner_by_numbers(spec, g)
      winner_by_nums = true
    end
  end

  if !winner_by_goal && !winner_by_nums  
    g.winner = Player(0)
    g.state = in_progress
  end
end


"""
winner_by_numbers(spec::Just4FunSpec, g::Just4FunEnv)::Tuple{Player, GameState}

Returns the winning player and the type of the win.
"""
function winner_by_numbers(spec::Just4FunSpec, g::Just4FunEnv)::Tuple{Player, GameState}
  
  points, max_field_points = get_points_info(g)
  all_same_points = all(p -> p == points[1], points)
  if all_same_points && !iszero(points[1])
    #@atomic push!(Just4Fun.STATS.wins_by_max_field_value, 1)
    winner = Player(argmax(max_field_points))
    reason = end_by_max_field
  elseif all_same_points && iszero(points[1])
    # note: it is not possible that no player has the highest field.
    # the only case in which both have the same number of points and there is no highest field would be if all players
    # place on the same fields, but then they would have 0 points
    #@atomic push!(Just4Fun.STATS.draw, 1)
    winner = Player(0)
    reason = end_by_draw
  else
    #@atomic push!(Just4Fun.STATS.wins_by_points, 1)
    winner = Player(argmax(points))
    reason = end_by_points
  end
  return (winner, reason)
end


"""
get_points_info(g::Just4FunEnv)::Tuple{Vector{FieldValue}, Vector{FieldValue}}
TODO: check profile info
Returns the points info (sum of fields with majority and the highest
field with majority) of each player.
"""
function get_points_info(g::Just4FunEnv)::Tuple{Vector{FieldValue}, Vector{FieldValue}}
  players = map(p_i -> Player(p_i), range(Just4Fun.YELLOW, length=NUM_PLAYERS))
  points = zeros(UInt8, NUM_PLAYERS)
  max_field_points = zeros(UInt8, NUM_PLAYERS)

  for field_value in FIELD_VALUES
    player_stones = get_stones(g, field_value)
    field_points = [has_majority(player_stones, player) ? field_value : 0x0 for player in players]
    max_field_points = [max(max_field_points[to_index(player)], field_points[to_index(player)]) for player in players]
    points .+= field_points
  end
  (points, max_field_points)
end