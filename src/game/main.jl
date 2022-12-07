const FEATURE_CARDS = true
const FEATURE_MULTI_STONE = true

######################
# Player constants - the colors on yucata.de
####
const YELLOW  = 0x1
const RED     = 0x2
const MAGENTA = 0x3
const GREEN   = 0x4

######################
# Game config constants
####
const JUST4FUN_DEFAULT_WIN_LENGTH = 4
const JUST4FUN_DEFAULT_SIZE_HAND = 4
const JUST4FUN_DEFAULT_NUM_PLAYER_STONES = 20 # HINT use 3 to test out of stones rule
const JUST4FUN_DEFAULT_DECK = [ # 55 cards
   1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12,
   1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12,
   1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12,
   1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12,
  13, 14, 15, 16, 17, 18, 19
]
const JUST4FUN_DEFAULT_ORIGINAL_DIST = [
   1 14 30 24 19  8 ;
  33 11  9 16 35 21 ;
   6 27 31 20  3 12 ;
  15 32  5 29 17 26 ;
  22 10 18 36 25  2 ;
  28  7 23  4 13 34
]
const JUST4FUN_DEFAULT_SIZE = size(JUST4FUN_DEFAULT_ORIGINAL_DIST)

include("types.jl")

######################
# Game configuration
####
const NUM_PLAYERS = 2 # TODO: currently only 2 player support - consider implementing the CommonRL interface which supports sequential multiplayer games
const SIDE_LENGTH = size(JUST4FUN_DEFAULT_ORIGINAL_DIST)[1]
const FIELD_VALUES  = SMatrix{SIDE_LENGTH, SIDE_LENGTH, FieldValue, SIDE_LENGTH^2}(JUST4FUN_DEFAULT_ORIGINAL_DIST) # Size <board_side> x <board_side> (x 1)
const DECK        = convert(Vector{CardValue}, JUST4FUN_DEFAULT_DECK)
const SIZE_HAND   = JUST4FUN_DEFAULT_SIZE_HAND
const NUM_PLAYER_STONES = JUST4FUN_DEFAULT_NUM_PLAYER_STONES
const WIN_LENGTH  = JUST4FUN_DEFAULT_WIN_LENGTH

include("utils.jl")

"""
ACTIONS::Vector{Action}
"""
const ACTIONS = actions = FEATURE_CARDS ?
  generate_card_actions(vec(FIELD_VALUES), DECK, SIZE_HAND) :
  generate_nocard_actions(vec(FIELD_VALUES))
const NUM_ACTIONS = length(ACTIONS)

"""
ACTION_ACTION_MASK_INDEX_MAP::Dict{Action, Int64}
"""
const ACTION_ACTION_MASK_INDEX_MAP = generate_action_mask_lookup_index(ACTIONS)

include("structs.jl")

include("rules.jl")

include("game.jl")

#####
##### Simple heuristic for minmax
#####
include("minimax.jl")

#####
##### Interaction API
#####
include("interaction_api.jl")