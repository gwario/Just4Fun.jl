module Just4Fun
using AlphaZero
using AlphaZero: Log
using StaticArrays
using Combinatorics
using DataStructures
using Crayons
using Random
using Formatting: fmt
using SnoopPrecompile

@precompile_all_calls include("game/main.jl")

@precompile_all_calls include("game/utils/state_rendering_utils.jl")

@precompile_all_calls include("settings.jl")


mini_j4f_nc_nf_nm_spec = Just4FunSpec(Player(YELLOW), mini_j4f_nc_nf_nm_settings)

mini_j4f_nc_nf_spec = Just4FunSpec(Player(YELLOW), mini_j4f_nc_nf_settings)

mini_j4f_nc_spec = Just4FunSpec(
    Player(YELLOW),
    Just4FunSettings(players = 2, cards = nothing, board = mini_j4f_board_settings),
)

mini_j4f_spec = Just4FunSpec(Player(YELLOW), mini_j4f_settings)



j4f_nc_spec = Just4FunSpec(
    Player(YELLOW),
    Just4FunSettings(players = 2, cards = nothing, board = BoardSettings()),
)
j4f_spec = Just4FunSpec()


export Just4FunSpec,
    Just4FunEnv,
    Just4FunEnvState,
    CardsState,
    Just4FunSettings,
    BoardSettings,
    CardsSettings,
    CardValue,
    Cards,
    Stones,
    FieldValue,
    Action,
    CardsAction,
    NoCardsAction
export Player, YELLOW, RED, GREEN, MAGENTA, next_player, curplayercards, player_name
export print_game_result, print_points
export GameState, in_progress, end_by_pattern, end_by_points, end_by_max_field, end_by_draw
export CARD_ACTION_SEPARATOR
end
