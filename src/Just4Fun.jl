module Just4Fun
using AlphaZero
using StaticArrays
using Combinatorics
using DataStructures
using Crayons
using Random
using SnoopPrecompile

@precompile_all_calls include("game/main.jl")

export Just4FunSpec, Just4FunEnv, Just4FunEnvState, CardValue, Cards, Stones, FieldValue, Action, CardsAction
export Player, YELLOW, RED, GREEN, MAGENTA, next_player, curplayercards, player_name
export print_game_result, print_points
export GameState, in_progress, end_by_pattern, end_by_points, end_by_max_field, end_by_draw
export CARD_ACTION_SEPARATOR
# TODO: make configurable in spec maybe
export FIELD_VALUES, FIELD_PROBAS, SIZE_HAND, SIDE_LENGTH, NUM_PLAYERS
export FEATURE_CARDS
end
