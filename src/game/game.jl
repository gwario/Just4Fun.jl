# NOTE: Has to be overwritten by the experimentt module
# GI.spec(g::Just4FunEnv) = Just4FunSpec()

GI.two_players(spec::Just4FunSpec) = NUM_PLAYERS == 2

"""
GI.actions(spec::Just4FunSpec)

Return the vector of all game actions. TODO: initialize on spec creation
"""
GI.actions(spec::Just4FunSpec) = ACTIONS

"""
GI.init(spec::Just4FunSpec, state) :: AbstractGameEnv

Create a new game environment in a (possibly random) initial state.
"""
function GI.init(spec::Just4FunSpec, state=nothing)
  if isnothing(state) && !isempty(spec.per_game_seeds)
    seed = rand(spec.per_game_seeds)
    Random.seed!(seed)
    @info "Re-Initialized game with random seed $(seed)!"
  end

  player_cards = SMatrix{SIZE_HAND, NUM_PLAYERS, CardValue}(zeros(CardValue, SIZE_HAND, NUM_PLAYERS))
  stack = Stack{CardValue}()
    
  # setup player cards
  if FEATURE_CARDS  
    if isnothing(state)
      # setup stack
      if isnothing(spec.initial_stack)
        stack = shuffle(copy(DECK))
      else
        stack = spec.initial_stack
      end

      for card_index = 1:SIZE_HAND
        for player_index = 1:NUM_PLAYERS
          card = pop!(stack)
          player_cards = setindex(player_cards, card, CartesianIndex(card_index, player_index))
        end
      end
    end
  else
    player_cards = SMatrix{SIZE_HAND, NUM_PLAYERS, CardValue}(zeros(CardValue, SIZE_HAND, NUM_PLAYERS))
  end

  # setup fields with stones
  field_stones = SArray{Tuple{SIDE_LENGTH, SIDE_LENGTH, NUM_PLAYERS}, Stones}(zeros(Stones, SIDE_LENGTH, SIDE_LENGTH, NUM_PLAYERS))
  # setup player's stones
  player_stones = SVector{NUM_PLAYERS, Stones}(repeat([Stones(NUM_PLAYER_STONES)], NUM_PLAYERS))
  # set current player
  curplayer = Player(YELLOW)
  # initialize actions masks
  actions_masks = SMatrix{NUM_ACTIONS, NUM_PLAYERS, UInt8}(zeros(UInt8, NUM_ACTIONS, NUM_PLAYERS))
  
  g = Just4FunEnv(
    stack, Cards(), player_cards,
    field_stones, player_stones,
    curplayer,
    actions_masks,
    in_progress, Player(0),
    []
  )
  
  if !isnothing(state)
    GI.set_state!(g, state) # update mask and status
  else
    update_action_mask!(g) # mask update might not be sufficient
    #update_status!(g)
  end
  return g
end

#####
##### Game API
#####

"""
GI.actions_mask(g::Just4FunEnv)

Returns a boolean actions_mask indicating all allowed actions among ACTIONS.
"""
function GI.actions_mask(g::Just4FunEnv)
  a = g.action_masks[:, to_index(g.curplayer)]
  return Vector{Bool}(a)
end

"""
  GI.current_state(g::Just4FunEnv)

Return the game state.
Warn: The state returned by this function may be stored (e.g. in the MCTS tree) and
must therefore either be fresh or persistent. If in doubt, you should make a copy.

NOTE: copy() is necessary
"""
function GI.current_state(g::Just4FunEnv)
  s = (
    stack           = Vector{CardValue}([c for c in Iterators.reverse(g.stack)]),
    used_cards      = copy(g.used_cards),
    player_cards    = g.player_cards,
    
    field_stones    = g.field_stones,
  
    player_stones   = g.player_stones,
    curplayer       = g.curplayer,

    state           = g.state,
    action_indices  = copy(g.action_indices) # necessary!
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
  game.stack = Stack{CardValue}()
  for c in state.stack
    push!(game.stack, c)
  end
  game.used_cards     = copy(state.used_cards)
  game.player_cards   = state.player_cards
  game.field_stones   = state.field_stones
  
  game.player_stones  = state.player_stones
  game.curplayer      = state.curplayer
  
  game.state          = state.state
  game.action_indices = copy(state.action_indices)

  update_status!(game)
end

"""
  GI.clone(g::Just4FunEnv)::Just4FunEnv

Return an independent copy of the given environment.

NOTE: copy() is necessary
"""
function GI.clone(g::Just4FunEnv)
  env = Just4FunEnv(
    copy(g.stack), copy(g.used_cards), g.player_cards,
    g.field_stones, g.player_stones,
    g.curplayer,
    g.action_masks, g.state, g.winner,
    copy(g.action_indices)
  )
  update_status!(env)
  return env
end

"""
clone(spec::Just4FunSpec)
Return an independent copy of the given specification.
"""
clone(spec::Just4FunSpec) = Just4FunSpec(isnothing(spec.initial_stack) ? nothing : copy(spec.initial_stack))

"""
When playing interactively, yellow is the ai and red the human player?!
"""
# TODO: change interface to support more players OR implement game in commonrl interface, which supports multi agent games
GI.white_playing(g::Just4FunEnv) = g.curplayer == Player(YELLOW)

"""
GI.game_terminated(g::Just4FunEnv)

Returns true if the game has terminated.
"""
GI.game_terminated(g::Just4FunEnv) = g.state > in_progress

"""
GI.white_reward(g::Just4FunEnv)

Return the intermediate reward obtained by the white player after
the last transition step. The result is undetermined when called
at an initial state.

Returns reward for the YELLOW player in a game.
"""
function GI.white_reward(g::Just4FunEnv)
  if GI.game_terminated(g)
    g.winner == Player(YELLOW) ?
      1. :
      g.winner == Player(RED) ?
        -1. :
        0.0
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
function GI.play!(g::Just4FunEnv, action)

  spec = GI.spec(g)

  # update state
  if FEATURE_CARDS
    if isredraw(action)
      curplayer_cards = curplayercards(g)
      put_down!(g, curplayer_cards)
      pick_cards!(g, length(curplayer_cards))
      
      #println("Before Play - Curplayer $(g.curplayer)")
      #for p in collect(1:NUM_PLAYERS)
      #  println("Before Play - Player $p $(convert(Int64, g.player_stones[p])) cards: $(convert(Array{Int64}, g.player_cards[:, p]))")
      #end
    else
      put_down!(g, action.cards)
      pick_cards!(g, length(action.cards))

      take_stone!(g)
      place_stone!(g, action.value)
    end

    push!(g.action_indices, ACTION_ACTION_MASK_INDEX_MAP[(cards=action.cards, value=action.value)])
  else
    take_stone!(g)
    place_stone!(g, action)

    push!(g.action_indices, action)
  end
  
  update_status!(g, action)

  stones_left = !iszero(sum(g.player_stones))
  # if at least some player has stones left
  if stones_left
    # try next player until someone has stones left
    while true
      g.curplayer = next_player(spec, g.curplayer)
      if !iszero(curplayerstones(g))
          break
      end
    end
  end
end