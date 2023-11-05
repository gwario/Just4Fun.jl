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
        player_cards = SMatrix{spec.settings.cards.size_hand,spec.settings.players,CardValue}(
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
                    player_cards = setindex(player_cards, card, CartesianIndex(card_index, player_index))
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
    field_stones = SArray{Tuple{size(spec.settings.board.value_distribution)...,spec.settings.players},Stones}(
        zeros(Stones, size(spec.settings.board.value_distribution)..., spec.settings.players),
    )
    # setup player's stones
    player_stones =
        SVector{spec.settings.players,Stones}(repeat([Stones(spec.settings.board.num_pieces)], spec.settings.players))
    # set current player
    curplayer = isnothing(spec.starting_player) ? Player(rand(1:spec.settings.players)) : spec.starting_player

    # initialize actions masks
    board_actions_masks =
        BitArray(zeros(UInt8, (size(spec.settings.board.value_distribution)..., spec.settings.players)))

    env = Just4FunEnv(
        stack,
        used_cards,
        player_cards,
        field_stones,
        player_stones,
        curplayer,
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

to_net(board) = vec(board)

"""
GI.actions(spec::Just4FunSpec)

Return the vector of all game actions.
"""
GI.actions(spec::Just4FunSpec)::Vector{Action} = convert(Vector{NoCardsAction}, net_actions(spec))


"""
GI.actions_mask(g::Just4FunEnv)

Returns a boolean mask indicating all allowed actions for the current player.
This does not reflect the available fields on the game board directly since it
is necessary do differentiate between two actions, even though they target the
same position on the board.
"""
GI.actions_mask(g::Just4FunEnv)::AbstractVector{Bool} = convert(Vector{Bool}, net_actions_mask(g))


"""
net_actions(spec::Just4FunSpec)::Vector{Int}

IMPORTANT: The output is of the network output size.
"""
net_actions(spec::Just4FunSpec)::Vector{FieldValue} = to_net(spec.settings.board.value_distribution)

"""
net_actions_mask(env::Just4FunEnv)

Converts the board based actions mask to a linear actions mask for the network outputs.
IMPORTANT: The input is of the board size.
IMPORTANT: The output is of the network output size.    
"""
function net_actions_mask(env::Just4FunEnv)::Vector
    return to_net(env.board_actions_masks[:, :, to_index(env.curplayer)])
end

"""
available_net_actions(game::Just4FunEnv)

same as default
"""
function available_net_actions(game::Just4FunEnv)
    mask = net_actions_mask(game)
    return net_actions(GI.spec(game))[mask]
end

"""
available_cards_actions(game::Just4FunEnv)::Vector{CardsAction}

evtl override default available_actions
"""
function available_cards_actions(game::Just4FunEnv)::Vector{CardsAction}
    spec = GI.spec(game)
    return available_cards_actions(spec, game, game.curplayer)
end

cards_actions(spec::Just4FunSpec, game::Just4FunEnv, player::Player) =
    map(cs -> CardsAction((cards = cs, value = sum(cs))), regular_combinations(spec, playercards(game, player)))

"""
available_cards_actions(spec::Just4FunSpec, game::Just4FunEnv, player::Player)::Vector{CardsAction}

evtl override default available_actions
"""
function available_cards_actions(spec::Just4FunSpec, game::Just4FunEnv, player::Player)::Vector{CardsAction}
    av_net_actions = available_net_actions(game)
    card_actions = cards_actions(spec, game, player)
    av_card_actions = filter(ca -> to_int_field_value(ca) in av_net_actions, card_actions)
    return av_card_actions
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
        actions = copy(g.actions), # necessary!
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
    game.actions = copy(state.actions)

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
        copy(g.board_actions_masks),
        g.state,
        g.winner,
        copy(g.actions),
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

    if !isnothing(spec.settings.cards)
        #@show action
        put_down!(spec, env, action.cards)
        pick_cards!(spec, env, length(action.cards))
    end

    take_stone!(env)
    place_stone!(spec, env, to_field_value(action))
    push!(env.actions, action)

    update_status!(spec, env, action)

    # try next player until someone has stones left or the game has ended
    #@show !GI.game_terminated(env)
    while !GI.game_terminated(env)
        env.curplayer = next_player(spec, env.curplayer)
        # check if a redraw should be applied and do it and go to the next player
        if !isnothing(spec.settings.cards) && isempty(available_cards_actions(env))
            #@info "Redraw happended"
            all_cards = curplayercards(env)
            put_down!(spec, env, all_cards)
            pick_cards!(spec, env, length(all_cards))

            push!(env.actions, CardsAction((cards = Cards(), value = FieldValue(0))))

            update_status!(spec, env)
        elseif !iszero(curplayerstones(env))
            #@show !iszero(curplayerstones(env))
            break
        end
    end
end