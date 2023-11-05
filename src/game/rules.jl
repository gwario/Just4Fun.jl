"""
has_majority(field_stones::AbstractVector{Stones}, player::Player)::Bool

Retruns true if player p is in the majority over all other players in this field.
"""
function has_majority(field_stones::AbstractVector{Stones}, player::Player)::Bool
    player_index = to_index(player)
    player_stones = field_stones[player_index]
    other_players_stones = [field_stones[i] for i = 1:length(field_stones) if i != player_index]
    ret = all(map(others_stones -> others_stones < player_stones, other_players_stones))
    return ret
end

"""
has_minority(field_stones::AbstractVector{Stones}, player::Player)::Bool

Retruns true if player p is in the minority over at least one other players in this field.
"""
function has_minority(field_stones::AbstractVector{Stones}, player::Player)::Bool
    player_index = to_index(player)
    player_stones = field_stones[player_index]
    other_players_stones = [field_stones[i] for i = 1:length(field_stones) if i != player_index]
    ret = any(map(others_stones -> others_stones > player_stones, other_players_stones))
    return ret
end

"""
dominated(field_stones::AbstractVector{Stones}, player::Player)::Bool

Retruns true if player p is dominated by another player in this cell.
"""
function dominated(field_stones::AbstractVector{Stones}, player::Player)::Bool
    player_index = to_index(player)
    player_stones = field_stones[player_index]
    other_players_stones = [field_stones[i] for i = 1:length(field_stones) if i != player_index]
    ret = any(map(others_stones -> others_stones - 1 > player_stones, other_players_stones))
    return ret
end

"""
dominant_player(field_stones::AbstractVector{Stones})::Union{Player,Nothing}

Retruns the player who is dominant in this field or nothing if there is none.
"""
function dominant_player(field_stones::AbstractVector{Stones})::Union{Player,Nothing}
    max, max_index = findmax(field_stones)
    other_players_stones = [field_stones[i] for i = 1:length(field_stones) if i != max_index]
    if all(map(value -> value <= max - 2, other_players_stones))
        res = Player(max_index)
    else
        res = nothing
    end
    return res
end

"""
is_available(field_stones::AbstractVector{Stones}, player::Player)::Bool

Returns true if the field is available for player, i.e. if player is not already
dominating the the opponents and the opponents do not dominate the field.
"""
function is_available(field_stones::AbstractVector{Stones}, player::Player)::Bool
    return !dominated(field_stones, player) && !dominating(field_stones, player)
end

"""
fields_reachability(spec::Just4FunSpec, player_cards::AbstractMatrix{CardValue}, player::Player)::Array{Float32}

Returns an array with values true, if the respective field is reachable with a player's hand.
"""
function fields_reachability(
    spec::Just4FunSpec,
    all_player_cards::AbstractMatrix{CardValue},
    player::Player,
)::Array{Float32}
    player_cards = all_player_cards[1:spec.settings.cards.size_hand, to_index(player)]
    player_card_combinations = regular_combinations(spec, player_cards)
    values = unique(map(cc -> sum(cc), player_card_combinations))
    field_array = zeros(Float32, size(spec.settings.board.value_distribution))
    for value in values
        positions = findall(isequal(value), spec.settings.board.value_distribution)
        for pos in positions
            field_array[pos] = 1.0
        end
    end
    return field_array
end

"""
fields_probability(spec::Just4FunSpec)::Array{Float32}

Returns an array with statisctical probabilites to be able to play the fields sampled from random hands.
"""
function fields_probability(spec::Just4FunSpec)::Array{Float32}
    if spec.settings.board.value_distribution == Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST
        Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST_PROBA
    elseif spec.settings.board.value_distribution == Just4Fun.MINI_JUST4FUN_DEFAULT_ORIGINAL_DIST
        Just4Fun.MINI_JUST4FUN_DEFAULT_ORIGINAL_DIST_PROBA
    else
        throw(
            DomainError(
                spec.settings.board.value_distribution,
                "No probability distribution for the given value distribution",
            ),
        )
    end
end

"""
dominating(field_stones::AbstractVector{Stones}, player::Player)::Bool

Retruns true if player p is dominating all other players in this cell.
"""
function dominating(field_stones::AbstractVector{Stones}, player::Player)::Bool
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
place_stone!(spec::Just4FunSpec, g::Just4FunEnv, field_value::FieldValue)

Increases the number of stones of the current player on the cell with index cell_index.
NOTE: replaces the immutable stones state
"""
function place_stone!(spec::Just4FunSpec, g::Just4FunEnv, field_value::FieldValue)
    player_index = to_index(g.curplayer)
    #field_index = findfirst(isequal(field_value), spec.settings.board.value_distribution)
    map_index = spec.field_value_map[field_value]
    player_field_index = CartesianIndex((map_index, player_index))

    new_curplayer_stones = g.field_stones[player_field_index] + 1

    g.field_stones = setindex(g.field_stones, new_curplayer_stones, player_field_index)
end

"""
get_stones(spec::Just4FunSpec, g::Just4FunEnv, field_value::FieldValue)::AbstractVector{Stones}

Returns the vector of stones on a field.
"""
function get_stones(spec::Just4FunSpec, g::Just4FunEnv, field_value::FieldValue)::AbstractVector{Stones}
    map_index = spec.field_value_map[field_value]
    #field_index = findfirst(isequal(field_value), spec.settings.board.value_distribution)
    #@assert field_index == map_index
    player_stones = g.field_stones[map_index[1], map_index[2], :]
    return player_stones
end

"""
player_fieldstones(s::Just4FunEnvState, x::Int, y::Int, player::Player)::Stones

Returns the vector of stones on a field.
"""
function player_fieldstones(s::Just4FunEnvState, x::Int, y::Int, player::Player)::Stones
    return s.field_stones[y, x, to_index(player)]
end

"""
put_down!(spec::Just4FunSpec, g::Just4FunEnv, cards_to_put_down::Cards)

Removes the cards from the curplayercards and adds them to the usedcards.
NOTE: updates mutable states in place and replaces immutable ones
NOTE: Vectors are replaced not modified inplace! (!worked)
"""
function put_down!(spec::Just4FunSpec, g::Just4FunEnv, cards_to_put_down::AbstractVector{CardValue})
    @assert(
        0 <= length(cards_to_put_down) && length(cards_to_put_down) <= spec.settings.cards.size_hand,
        "Trying to put down an invalid number of cards"
    )
    player_index = to_index(g.curplayer)
    #@show cards_to_put_down
    #@show player_cards = g.player_cards[:, player_index]
    for card_to_put_down in cards_to_put_down
        # find the index of the card
        player_cards = g.player_cards[:, player_index]
        #@show card_to_put_down, g.player_cards[:, player_index]
        card_index = findfirst(card -> card == card_to_put_down, player_cards)
        @assert !isnothing(card_index) "Trying to put down a card that's not in hand!"
        #@show card_index
        # remove it from player's hand
        g.player_cards = setindex(g.player_cards, CardValue(0), CartesianIndex(card_index, player_index))
        #@show getindex(g.player_cards, CartesianIndex(card_index, player_index))
        # add it to the usedcards
        g.used_cards = push!(copy(g.used_cards), card_to_put_down)
    end
end

"""
pick_cards!(spec::Just4FunSpec, g::Just4FunEnv, number::Int64)

Removes the cards from gamecards and adds them to the curplayercards.
NOTE: Vectors are replaced not modified inplace!
"""
function pick_cards!(spec::Just4FunSpec, g::Just4FunEnv, amount::Int64)
    @assert(1 <= amount && amount <= spec.settings.cards.size_hand, "Trying to pick an invalid number of cards")

    curplayer_index = to_index(g.curplayer)

    for _ = 1:amount

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
empty_field(player_stones::AbstractVector{Stones})::Bool
Returns true if there are no stones on the cell
"""
empty_field(player_stones::AbstractVector{Stones})::Bool = sum(player_stones) == 0

"""
next_player(spec::Just4FunSpec, player::Player)::Player
Returns the next player in the order of play.
NOTET: Players are in ascending order from 1
"""
next_player(spec::Just4FunSpec, player::Player)::Player = 0x1 + (player % spec.settings.players)

"""
previous_player(spec::Just4FunSpec, player::Player)::Player
Returns the previous player in the order of play.
NOTET: Players are in ascending order from 1
"""
previous_player(spec::Just4FunSpec, player::Player)::Player =
    next_player(spec, Player(player + spec.settings.players - 0x2))

"""
is_curplayer_index(g::Just4FunEnv, player_index::Int64)::Bool

Retruns true if the index (of the cell) is the one of the curplayer.
"""
is_curplayer_index(g::Just4FunEnv, player_index::Int64)::Bool = to_index(g.curplayer) == player_index

"""
curplayercards(g::Just4FunEnv)::AbstractVector{CardValue}

Returns the current player's cards.
"""
curplayercards(g::Just4FunEnv)::AbstractVector{CardValue} = playercards(g, g.curplayer)

"""
playercards(g::Just4FunEnv, player::Player)::AbstractVector{CardValue}

Returns the player's cards.
"""
playercards(g::Just4FunEnv, player::Player)::AbstractVector{CardValue} = g.player_cards[:, to_index(player)]

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
valid_pos(spec::Just4FunSpec, (col, row))::Bool

Returns true if the position specified by rown and column number,
is within the bounds of the board.
"""
function valid_pos(spec::Just4FunSpec, (col, row))::Bool
    num_rows, num_cols = size(spec.settings.board.value_distribution)
    1 <= col <= num_cols && 1 <= row <= num_rows
end

"""
num_connected_dir(spec::Just4FunSpec, field_stones::AbstractArray{Stones}, player::Player, field_value::FieldValue, dir)::Int64

Returns the number of field a player has the majoriy on in a direction.
 ___
/|\

NOTE: The field the action is pointing to is not counted!
"""
function num_connected_dir(
    spec::Just4FunSpec,
    field_stones::AbstractArray{Stones},
    player::Player,
    field_value::FieldValue,
    dir,
)::Int64
    #position = findfirst(isequal(Int64(field_value)), spec.settings.board.value_distribution) # cartesian index
    position = spec.field_value_map[field_value]
    p = Tuple(position) .+ dir
    n = 0
    while valid_pos(spec, p) && has_majority(field_stones[p[1], p[2], :], player)
        n += 1
        p = p .+ dir
    end
    return n
end

"""
num_connected_axis(spec::Just4FunSpec, field_stones::AbstractArray{Stones}, player::Player, field_value::FieldValue, axis)::Int64

__`|/__
  /|\

Returns the number of connected fields with majority from the point action is pointing to.
Does not include the point itself!
"""
function num_connected_axis(
    spec::Just4FunSpec,
    field_stones::AbstractArray{Stones},
    player::Player,
    field_value::FieldValue,
    axis,
)::Int64
    num_after = num_connected_dir(spec, field_stones, player, field_value, axis)
    num_before = num_connected_dir(spec, field_stones, player, field_value, (0, 0) .- axis)
    return num_before + num_after
end

"""
winning_pattern_at(spec::Just4FunSpec, field_stones::AbstractArray{Stones}, player::Player, field_value::FieldValue)::Bool

Returns true if the action caused a winning pattern to emerge.
"""
function winning_pattern_at(
    spec::Just4FunSpec,
    field_stones::AbstractArray{Stones},
    player::Player,
    field_value::FieldValue,
)::Bool
    position = findfirst(v -> v == field_value, spec.settings.board.value_distribution) # cartesian index
    players_stones = field_stones[position[1], position[2], :]
    num_at = has_majority(players_stones, player) ? 1 : 0

    if num_at == 1
        pattern_at = any(((1, 1), (1, -1), (1, 0), (0, 1))) do axis
            num_before_and_after = num_connected_axis(spec, field_stones, player, field_value, axis)
            num_before_and_after + num_at >= spec.settings.board.length_win
        end
    else
        pattern_at = false
    end
    return pattern_at
end

"""
num_connected_at(spec::Just4FunSpec, field_stones::AbstractArray{Stones}, player::Player, field_value::FieldValue)::Int64

Returns number of connected fields at a field for a player in all the directions.
"""
function num_connected_at(
    spec::Just4FunSpec,
    field_stones::AbstractArray{Stones},
    player::Player,
    field_value::FieldValue,
)::Int64
    position = findfirst(v -> v == field_value, spec.settings.board.value_distribution) # cartesian index
    players_stones = field_stones[position[1], position[2], :]
    num_at = has_majority(players_stones, player) ? 1 : 0

    if num_at == 1
        4 + mapreduce(+, [(1, 1), (1, -1), (1, 0), (0, 1)]; init = 0) do axis
            num_connected_axis(spec, field_stones, player, field_value, axis)
        end
    else
        return 0
    end
end

to_action(cards::Cards)::Action = (cards = cards, value = FieldValue(sum(cards)))

"""
update_action_mask!(spec::Just4FunSpec, env::Just4FunEnv)

Updates the action masks of all players.
"""
function update_action_mask!(spec::Just4FunSpec, env::Just4FunEnv)
    # reset all masks
    env.board_actions_masks = falses(size(env.board_actions_masks))

    if isnothing(spec.settings.cards)
        all_actions = GI.actions(spec)
        for player_index in range(YELLOW, length = spec.settings.players)
            player = Player(player_index)
            for action in all_actions
                field_stones = get_stones(spec, env, FieldValue(action))
                available =
                    spec.settings.board.single_piece ? empty_field(field_stones) :
                    (is_available(field_stones, player) || empty_field(field_stones))
                # update state
                #idx = findfirst(isequal(action), spec.settings.board.value_distribution)
                idx = spec.field_value_map[FieldValue(action)]
                setindex!(env.board_actions_masks, available, CartesianIndex((idx, player_index)))
            end
        end
    else
        for player_index in range(YELLOW, length = spec.settings.players)
            player = Player(player_index)
            # get the possible cells according to combinations of the players cards
            actions = unique(map(to_int_field_value, cards_actions(spec, env, player)))
            for action in actions
                field_stones = get_stones(spec, env, FieldValue(action))
                #@show action
                #@show spec.settings.board.single_piece
                #@show empty_field(field_stones)
                available =
                    spec.settings.board.single_piece ? empty_field(field_stones) :
                    (is_available(field_stones, player) || empty_field(field_stones))
                # update state
                #idx = findfirst(isequal(action), spec.settings.board.value_distribution)
                idx = spec.field_value_map[FieldValue(action)]
                setindex!(env.board_actions_masks, available, CartesianIndex((idx, player_index)))
            end
        end
    end
end

"""
update_status!(spec::Just4FunSpec, env::Just4FunEnv, action::Action)

Update the game status assuming g.curplayer just played action.
NOTE: seen as if the current player has just played action!
* actions_masks
* finished (current player has won; no actions nor stones left for the next player)
* winner
"""
function update_status!(spec::Just4FunSpec, env::Just4FunEnv, action::Action)

    update_action_mask!(spec, env)

    no_stones_left = iszero(sum(env.player_stones))

    if winning_pattern_at(spec, env.field_stones, env.curplayer, to_field_value(action))
        env.winner = env.curplayer
        env.state = end_by_pattern
    elseif no_stones_left
        if spec.settings.board.count_values
            env.winner, env.state = winner_by_numbers(spec, env)
        else
            env.winner = Player(0)
            env.state = end_by_draw
        end
    else
        env.winner = Player(0)
        env.state = in_progress
    end
end

"""
update_status!(spec::Just4FunSpec, env::Just4FunEnv)
NOTE: seen as if the current player is about to play!
Update the game status:
* actions_masks
* finished (any player has won; no actions nor stones left for the current player)
* winner
"""
function update_status!(spec::Just4FunSpec, env::Just4FunEnv)

    update_action_mask!(spec, env)
    # FIXME: performance improvements possible
    for player_index in range(1, length = spec.settings.players)
        player = Player(player_index)
        for field_value in spec.settings.board.value_distribution
            if winning_pattern_at(spec, env.field_stones, player, UInt8(field_value))
                env.winner = player
                env.state = end_by_pattern
                return
            end
        end
    end

    no_stones_left = iszero(sum(env.player_stones))

    if no_stones_left
        if spec.settings.board.count_values
            env.winner, env.state = winner_by_numbers(spec, env)
        else
            env.winner = Player(0)
            env.state = end_by_draw
        end
    else
        env.winner = Player(0)
        env.state = in_progress
    end
end


"""
winner_by_numbers(spec::Just4FunSpec, g::Just4FunEnv)::Tuple{Player, GameState}

Returns the winning player and the type of the win.
"""
function winner_by_numbers(spec::Just4FunSpec, g::Just4FunEnv)::Tuple{Player,GameState}
    points, max_field_points = get_points_info(spec, g)
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
get_points_info(spec::Just4FunSpec, g::Just4FunEnv)::Tuple{Vector{Int64}, Vector{Int64}}
TODO: check profile info
Returns the points info (sum of fields with majority and the highest
field with majority) of each player.
"""
function get_points_info(spec::Just4FunSpec, g::Just4FunEnv)::Tuple{Vector{Int64},Vector{Int64}}
    players = map(p_i -> Player(p_i), range(Just4Fun.YELLOW, length = spec.settings.players))
    points = zeros(Int64, spec.settings.players)
    max_field_points = zeros(Int64, spec.settings.players)

    for field_value in spec.settings.board.value_distribution
        player_stones = get_stones(spec, g, FieldValue(field_value))
        field_points = [has_majority(player_stones, player) ? field_value : 0 for player in players]
        max_field_points =
            [max(max_field_points[to_index(player)], field_points[to_index(player)]) for player in players]
        points .+= field_points
    end
    (points, max_field_points)
end
