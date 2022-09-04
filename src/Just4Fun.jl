module Just4Fun
using AlphaZero
using StaticArrays
using Combinatorics
using DataStructures
using Crayons
using Random

include("game/main.jl")

export Just4FunEnv, Just4FunSpec, CardValue, Cards, Stones, FieldValue, CardsAction
export Player, YELLOW, RED, GREEN, MAGENTA
export GameState, in_progress, end_by_pattern, end_by_points, end_by_max_field, end_by_draw
export CARD_ACTION_SEPARATOR
# TODO: make configurable in spec maybe
export FIELD_VALUES
export FEATURE_CARDS
end
