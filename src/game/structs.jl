######################)
# Structures
####
struct Just4FunSpec <: GI.AbstractGameSpec

  starting_player :: Union{Nothing,Player}
  per_game_seeds  :: Vector{Int64}
  initial_stack   :: Stack{CardValue}

  """
  Just4FunSpec(starting_player::Union{Nothing,Player}=Player(YELLOW))::Just4FunSpec
  """
  function Just4FunSpec(starting_player::Union{Nothing,Player}=Player(YELLOW))::Just4FunSpec
    new(starting_player, Int64[], Stack{CardValue}())
  end

  """
  Just4FunSpec(per_game_seeds::Vector{Int64}, starting_player::Union{Nothing,Player}=Player(YELLOW))::Just4FunSpec
  """
  function Just4FunSpec(per_game_seeds::Vector{Int64}, starting_player::Union{Nothing,Player}=Player(YELLOW))::Just4FunSpec
    new(starting_player, per_game_seeds, Stack{CardValue}())
  end
  
  """
  Just4FunSpec(predefined_stack::Stack{CardValue}, starting_player::Union{Nothing,Player}=Player(YELLOW))::Just4FunSpec
  """
  function Just4FunSpec(predefined_stack::Stack{CardValue}, starting_player::Union{Nothing,Player}=Player(YELLOW))::Just4FunSpec
    new(starting_player, Int64[], predefined_stack)
  end

  """
  Just4FunSpec(predefined_stack::Stack{CardValue}, per_game_seeds::Vector{Int64}, starting_player::Union{Nothing,Player}=Player(YELLOW))::Just4FunSpec
  """
  function Just4FunSpec(predefined_stack::Stack{CardValue}, per_game_seeds::Vector{Int64}, starting_player::Union{Nothing,Player}=Player(YELLOW))::Just4FunSpec
    new(starting_player, per_game_seeds, predefined_stack)
  end
end

mutable struct Just4FunEnv <: GI.AbstractGameEnv

  # state
  stack         :: Stack{CardValue}
  used_cards    :: Cards                                      # the played cards, for convenience
  player_cards  :: SMatrix{SIZE_HAND, NUM_PLAYERS, CardValue} # the players' cards Size <size hand> x <players> (x 1)
  field_stones  :: SArray{Tuple{SIDE_LENGTH, SIDE_LENGTH, NUM_PLAYERS}, Stones}# Size <board_side> x <board_side> x <players> (x 1)
  player_stones :: SVector{NUM_PLAYERS, Stones}               # Size <players> (x 1)
  curplayer     :: Player
  # status helpers
  action_masks  :: BitArray{2}   # Action masks for each players Size <num actions> x <players> (x 1)
  state         :: GameState
  winner        :: Player

  # Used for precise stats on game end and number of regular vs redraw actions
  action_indices:: Vector{Int64} # The indices of the played actions in the action mask. can be looked up efficiently via the map
  
end
