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
const JUST4FUN_DEFAULT_ORIGINAL_DIST_PROBA = [
  0.267296233 0.469242162 0.198726472 0.332591218 0.483859943 0.450617574 ;
  0.135348055 0.548315473 0.484489037 0.477508971 0.105489276 0.405351392 ;
  0.392417909 0.266955352 0.176339055 0.419485109 0.31642633  0.578515116 ;
  0.477425085 0.149475789 0.369025682 0.223520111 0.483325316 0.285352034 ;
  0.381964265 0.51268663  0.480878012 0.090193771 0.306233956 0.286839113 ;
  0.243928644 0.424993936 0.361784375 0.33798669  0.467130181 0.118146527
]

const JUST4FUN_DEFAULT_SIZE = size(JUST4FUN_DEFAULT_ORIGINAL_DIST)

include("types.jl")

######################
# Game configuration
####
const NUM_PLAYERS = 2 # TODO: currently only 2 player support - consider implementing the CommonRL interface which supports sequential multiplayer games
const SIDE_LENGTH = size(JUST4FUN_DEFAULT_ORIGINAL_DIST)[1]
const FIELD_VALUES  = SMatrix{SIDE_LENGTH, SIDE_LENGTH, FieldValue, SIDE_LENGTH^2}(JUST4FUN_DEFAULT_ORIGINAL_DIST) # Size <board_side> x <board_side> (x 1)
const FIELD_PROBAS  = JUST4FUN_DEFAULT_ORIGINAL_DIST_PROBA
const DECK        = convert(Vector{CardValue}, JUST4FUN_DEFAULT_DECK)
const SIZE_HAND   = JUST4FUN_DEFAULT_SIZE_HAND
const NUM_PLAYER_STONES = JUST4FUN_DEFAULT_NUM_PLAYER_STONES
const WIN_LENGTH  = JUST4FUN_DEFAULT_WIN_LENGTH

include("utils.jl")

const _CARDS_ACTIONS = generate_card_actions(vec(FIELD_VALUES), DECK, SIZE_HAND)

const _NO_CARDS_ACTIONS = generate_nocard_actions(vec(FIELD_VALUES))
"""
ACTIONS::Vector{Action}
"""
const ACTIONS::Vector{Action} = FEATURE_CARDS ?
  _CARDS_ACTIONS :
  _NO_CARDS_ACTIONS

const NUM_ACTIONS = length(ACTIONS)

"""
ACTION_ACTION_MASK_INDEX_MAP::Dict{Action, Int64}
"""
const ACTION_ACTION_MASK_INDEX_MAP = FEATURE_CARDS ?
  generate_action_mask_lookup_index(_CARDS_ACTIONS) :
  generate_action_mask_lookup_index(_NO_CARDS_ACTIONS)
@show typeof(ACTION_ACTION_MASK_INDEX_MAP)

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