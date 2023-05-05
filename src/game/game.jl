# NOTE: Has to be overwritten by the experimentt module
# GI.spec(g::Just4FunEnv) = Just4FunSpec()
# GI.spec(s::Just4FunEnvState) = Just4FunSpec()

GI.two_players(spec::Just4FunSpec)::Bool = spec.settings.players == 2

"""
GI.init(spec::Just4FunSpec, state)::AbstractGameEnv

Create a new game environment in a (possibly random) initial state.
"""
function GI.init(spec::Just4FunSpec, state = nothing)::Just4FunEnv
    if isnothing(state) && !isempty(spec.per_game_seeds)
        seed = rand(spec.per_game_seeds)
        Random.seed!(seed)
        @info "Re-Initialized game with random seed $(seed)!"
    end

    if !isnothing(spec.settings.cards)
        player_cards =
            SMatrix{spec.settings.cards.size_hand,spec.settings.players,CardValue}(
                zeros(CardValue, spec.settings.cards.size_hand, spec.settings.players),
            )
        stack = Stack{CardValue}()

        # setup player cards
        if isnothing(state)
            # setup stack
            if isempty(spec.initial_stack)
                stack = shuffle(convert(Vector{CardValue}, spec.settings.cards.deck))
            else
                stack = spec.initial_stack
            end

            for card_index = 1:spec.settings.cards.size_hand
                for player_index = 1:spec.settings.players
                    card = pop!(stack)
                    player_cards = setindex(
                        player_cards,
                        card,
                        CartesianIndex(card_index, player_index),
                    )
                end
            end
        end
        used_cards = Cards()
    else
        stack = Stack{CardValue}()
        player_cards = Matrix{CardValue}(zeros(CardValue, 2, 2))
        used_cards = Cards()
    end

    # setup fields with stones
    field_stones = SArray{
        Tuple{
            size(spec.settings.board.value_distribution)...,
            spec.settings.players,
        },
        Stones,
    }(
        zeros(
            Stones,
            size(spec.settings.board.value_distribution)...,
            spec.settings.players,
        ),
    )
    # setup player's stones
    player_stones = SVector{spec.settings.players, Stones}(
        repeat([Stones(spec.settings.board.num_pieces)], spec.settings.players),
    )
    # set current player
    curplayer =
        isnothing(spec.starting_player) ? Player(rand(1:spec.settings.players)) :
        spec.starting_player

    n_actions = GI.num_actions(spec)
    # initialize actions masks
    actions_masks = BitMatrix(
        zeros(UInt8, n_actions, spec.settings.players),
    )
    board_actions_masks =
        BitArray(
            zeros(UInt8, (size(spec.settings.board.value_distribution)..., spec.settings.players)),
        )

    env = Just4FunEnv(
        stack,
        used_cards,
        player_cards,
        field_stones,
        player_stones,
        curplayer,
        actions_masks,
        board_actions_masks,
        in_progress,
        Player(0),
        [],
    )

    if !isnothing(state)
        GI.set_state!(env, state) # update mask and status
    else
        update_action_mask!(spec, env) # mask update might not be sufficient
        #update_status!(spec, g)
    end
    return env
end

#####
##### Game API
#####

"""
GI.actions_mask(g::Just4FunEnv)

Returns a boolean mask indicating all allowed actions for the current player.
This does not reflect the available fields on the game board directly since it
is necessary do differentiate between two actions, even though they target the
same position on the board.
"""
function GI.actions_mask(g::Just4FunEnv)::AbstractVector{Bool}
    a = g.actions_masks[:, to_index(g.curplayer)]
    return Vector{Bool}(a)
end

"""
GI.actions(spec::Just4FunSpec)

Return the vector of all game actions.
"""
GI.actions(spec::Just4FunSpec)::Vector{Action} = spec.actions


"""
board_actions_mask(spec::Just4FunSpec, env::Just4FunEnv)::AbstractMatrix{Bool}

Returns a boolean mask indicating all allowed board positions for the current player.

This DOES reflect the available fields on the game board directly.

IMPORTANT: The output is of the board size.
"""
function board_actions_mask(spec::Just4FunSpec, env::Just4FunEnv)::AbstractMatrix{Bool}
    a = env.board_actions_masks[:, :, to_index(env.curplayer)]
    return a
end

"""
board_π(spec::Just4FunSpec, env::Just4FunEnv, π)

Converts the action based policy to a board based policy.
IMPORTANT: The input is of the GI.available_actions size.
IMPORTANT: The output is of the board size.
"""
function board_π(spec::Just4FunSpec, env::Just4FunEnv, π)
    available_actions = GI.available_actions(env)
    @assert size(available_actions) == size(π)
    actions_board = board_actions(spec)
    
    board_p = zeros(size(actions_board))
    for (p_idx, action) in enumerate(available_actions)
        board_idx = findfirst(isequal(to_int_field_value(action)), actions_board)
        if !isnothing(board_idx)
            board_p[board_idx] = π[p_idx]
        end
    end
    return board_p
end

"""
net_actions(spec::Just4FunSpec)::Vector{Int}

IMPORTANT: The output is of the network output size.
"""
net_actions(spec::Just4FunSpec)::Vector{Int} = vec(board_actions(spec))

"""
board_actions(spec::Just4FunSpec)::Matrix{Int}

IMPORTANT: The output is of the board size.
"""
board_actions(spec::Just4FunSpec)::Matrix{Int} = spec.settings.board.value_distribution

"""
net_actions_mask(spec::Just4FunSpec, board_actions_mask)

Converts the board based actions mask to a linear actions mask for the network outputs.
IMPORTANT: The input is of the board size.
IMPORTANT: The output is of the network output size.    
"""
function net_actions_mask(spec::Just4FunSpec, board_actions_mask)
    @assert size(board_actions_mask) == size(board_actions(spec))
    return vec(board_actions_mask)
end

"""
net_π(spec::Just4FunSpec, board_π)

Converts the board based policy to a linear policy of the network outputs.

IMPORTANT: The input is of the board size.
IMPORTANT: The output is of the network output size.    
"""
function net_π(spec::Just4FunSpec, board_π)
    @assert size(board_π) == size(board_actions(spec))
    return vec(board_π)
end

"""
available_net_actions_indices(spec::Just4FunSpec, env::Just4FunEnv)::Vector{Int64}

IMPORTANT: The output is of the network output size.    
"""
function available_net_actions_indices(spec::Just4FunSpec, env::Just4FunEnv)::Vector{Int}
    available_actions = GI.available_actions(env)
    available_net_actions = filter(a -> a in net_actions(spec), map(to_field_value, available_actions))
    return [
        findfirst(isequal(action), net_actions(spec)) for
        action in available_net_actions
    ]
end


"""
  GI.current_state(g::Just4FunEnv)

Return the game state.
Warn: The state returned by this function may be stored (e.g. in the MCTS tree) and
must therefore either be fresh or persistent. If in doubt, you should make a copy.

NOTE: copy() is necessary
"""
function GI.current_state(g::Just4FunEnv)::Just4FunEnvState
    s = (
        stack = Vector{CardValue}([c for c in Iterators.reverse(g.stack)]),
        used_cards = copy(g.used_cards),
        player_cards = Matrix(g.player_cards),
        field_stones = Array(g.field_stones),
        player_stones = Vector(g.player_stones),
        curplayer = g.curplayer,
        state = g.state,
        winner = g.winner,
        action_indices = copy(g.action_indices), # necessary!
    )
    return s
end

"""
GI.set_state!(game::Just4FunEnv, state)
Warn: Modify the state of a game environment in place.
state:
* stack
* used_cards
* player_cards
* field_stones
* player_stones
* curplayer

NOTE: copy() is necessary
"""
function GI.set_state!(game::Just4FunEnv, state)
    spec = GI.spec(game)
    game.stack = Stack{CardValue}()
    for c in state.stack
        push!(game.stack, c)
    end
    game.used_cards = copy(state.used_cards)
    game.player_cards = SMatrix{size(state.player_cards)...}(state.player_cards)
    game.field_stones = SArray{Tuple{size(state.field_stones)...}}(state.field_stones)

    game.player_stones = SVector{length(state.player_stones)}(state.player_stones)
    game.curplayer = state.curplayer

    game.state = state.state
    game.action_indices = copy(state.action_indices)

    update_status!(spec, game)
end

"""
  GI.clone(g::Just4FunEnv)::Just4FunEnv

Return an independent copy of the given environment.

NOTE: copy() is necessary
"""
function GI.clone(g::Just4FunEnv)::Just4FunEnv
    spec = GI.spec(g)
    env = Just4FunEnv(
        copy(g.stack),
        copy(g.used_cards),
        g.player_cards,
        g.field_stones,
        g.player_stones,
        g.curplayer,
        copy(g.actions_masks),
        copy(g.board_actions_masks),
        g.state,
        g.winner,
        copy(g.action_indices),
    )
    update_status!(spec, env)
    return env
end

"""
When playing interactively, yellow is the ai and red the human player?!
"""
# TODO: change interface to support more players OR implement game in commonrl interface, which supports multi agent games
GI.white_playing(g::Just4FunEnv)::Bool = g.curplayer == Player(YELLOW)

"""
GI.game_terminated(g::Just4FunEnv)

Returns true if the game has terminated.
"""
GI.game_terminated(g::Just4FunEnv)::Bool = g.state != in_progress

"""
GI.white_reward(g::Just4FunEnv)

Return the intermediate reward obtained by the white player after
the last transition step. The result is undetermined when called
at an initial state.

Returns reward for the YELLOW player in a game.
"""
#function GI.white_reward(g::Just4FunEnv)::Float32 end

function white_reward_ternary_outcome(g::Just4FunEnv)::Float32
    if GI.game_terminated(g)
        g.winner == Player(YELLOW) ? 1.0 : g.winner == Player(RED) ? -1.0 : 0.0
    else
        0.0
    end
end

function white_reward_ternary_intermediary_reward(g::Just4FunEnv)::Float32
    if GI.game_terminated(g)
        g.winner == Player(YELLOW) ? 1.0 : g.winner == Player(RED) ? -1.0 : 0.0
    else
        s = GI.spec(g)
        p_patterns = [0, 0]
        for p_idx in 1:s.settings.players
            for field_value_int in s.settings.board.value_distribution
                p_patterns[p_idx] += num_connected_at(s, g.field_stones, Player(p_idx), FieldValue(field_value_int))
            end
        end
        # should be att most +/-0.75 in contrast to 1/-1 for win
        #@show p_patterns[1]
        #@show p_patterns[2]
        #@show sum(p_patterns)
        #@show 0.75 * (p_patterns[1] - p_patterns[2]) / sum(p_patterns)
        return 0.75 * (p_patterns[1] - p_patterns[2]) / sum(p_patterns)
    end
end

# This function does not need to be deterministic, so it might be an option to pick the cards randomly here an not just randomize the deck at the beginning.
# ...this is not sufficient for determinization anyways since the mcts player picks a different set of cards to play everytime...
"""
GI.play!(g::Just4FunEnv, action)::Union{Union{CardsAction, Nothing},Int64}

Update the game environment by making the current player perform action. Note that this function does not have to be deterministic.

Action will be an Int64
NOTE: Vectors MUST be replaced not modified inplace! Otherwise the mcts tree dict wont work.
"""
function GI.play!(env::Just4FunEnv, action::Action)

    spec = GI.spec(env)

    # update state
    if !isnothing(spec.settings.cards)
        if isredraw(action)
            curplayer_cards = curplayercards(env)
            put_down!(spec, env, Cards(curplayer_cards))
            pick_cards!(spec, env, length(curplayer_cards))
        else
            put_down!(spec, env, action.cards)
            pick_cards!(spec, env, length(action.cards))

            take_stone!(env)
            place_stone!(spec, env, action.value)
        end

        push!(env.action_indices, findfirst(isequal(action), GI.actions(spec)))
    else
        take_stone!(env)
        place_stone!(spec, env, action)

        push!(env.action_indices, action)
    end

    update_status!(spec, env, action)

    stones_left = !iszero(sum(env.player_stones))
    # if at least some player has stones left
    if stones_left
        # try next player until someone has stones left
        while true
            env.curplayer = next_player(spec, env.curplayer)
            if !iszero(curplayerstones(env))
                break
            end
        end
    end
end
