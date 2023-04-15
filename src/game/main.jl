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
const MINI_JUST4FUN_DEFAULT_WIN_LENGTH = 4

const JUST4FUN_DEFAULT_SIZE_HAND = 4
const MINI_JUST4FUN_DEFAULT_SIZE_HAND = 4

const JUST4FUN_DEFAULT_NUM_PLAYER_STONES = 20
const MINI_JUST4FUN_DEFAULT_NUM_PLAYER_STONES = 10

const JUST4FUN_DEFAULT_DECK = [ # 55 cards
  01,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12,
  01,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12,
  01,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12,
  01,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12,
  13, 14, 15, 16, 17, 18, 19
]
const MINI_JUST4FUN_DEFAULT_DECK = [ # 24 cards
  1, 2, 3, 4, 5,
  1, 2, 3, 4, 5,
  1, 2, 3, 4, 5,
  1, 2, 3, 4, 5,
  6, 7, 8, 9
]

const JUST4FUN_DEFAULT_ORIGINAL_DIST = [
  01 14 30 24 19  8 ;
  33 11  9 16 35 21 ;
  06 27 31 20  3 12 ;
  15 32  5 29 17 26 ;
  22 10 18 36 25  2 ;
  28  7 23  4 13 34
]
const MINI_JUST4FUN_DEFAULT_ORIGINAL_DIST = [
  05  3  6 15 ;
  11 13  9  1 ;
  14  2 12  7 ;
  04  8 16 10
]

const JUST4FUN_DEFAULT_ORIGINAL_DIST_PROBA = [
  0.267296233 0.469242162 0.198726472 0.332591218 0.483859943 0.450617574 ;
  0.135348055 0.548315473 0.484489037 0.477508971 0.105489276 0.405351392 ;
  0.392417909 0.266955352 0.176339055 0.419485109 0.31642633  0.578515116 ;
  0.477425085 0.149475789 0.369025682 0.223520111 0.483325316 0.285352034 ;
  0.381964265 0.51268663  0.480878012 0.090193771 0.306233956 0.286839113 ;
  0.243928644 0.424993936 0.361784375 0.33798669  0.467130181 0.118146527
]
const MINI_JUST4FUN_DEFAULT_ORIGINAL_DIST_PROBA = [
  0.869246  0.708362  0.759938  0.331556 ;
  0.649476  0.514141  0.820149  0.544312 ;
  0.427386  0.618023  0.582679  0.790006 ;
  0.789095  0.814536  0.264685  0.735307
]

######################
# Game configuration
####

include("types.jl")

include("structs.jl")

include("utils.jl")

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