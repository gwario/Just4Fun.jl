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

mini_j4f_cards_settings = CardsSettings(
    size_hand = Just4Fun.MINI_JUST4FUN_DEFAULT_SIZE_HAND,
    deck = Just4Fun.MINI_JUST4FUN_DEFAULT_DECK,
)
mini_j4f_board_settings = BoardSettings(
    value_distribution = Just4Fun.MINI_JUST4FUN_DEFAULT_ORIGINAL_DIST,
    length_win = Just4Fun.MINI_JUST4FUN_DEFAULT_WIN_LENGTH,
    num_pieces = Just4Fun.MINI_JUST4FUN_DEFAULT_NUM_PLAYER_STONES,
    single_piece = false,
    count_values = true,
)
mini_j4f_settings = Just4FunSettings(
    players = 2,
    cards = mini_j4f_cards_settings,
    board = mini_j4f_board_settings,
)

j4f_cards_settings = CardsSettings(
    size_hand = Just4Fun.JUST4FUN_DEFAULT_SIZE_HAND,
    deck = Just4Fun.JUST4FUN_DEFAULT_DECK,
)
j4f_board_settings = BoardSettings(
    value_distribution = Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST,
    length_win = Just4Fun.JUST4FUN_DEFAULT_WIN_LENGTH,
    num_pieces = Just4Fun.JUST4FUN_DEFAULT_NUM_PLAYER_STONES,
    single_piece = false,
    count_values = true,
)
j4f_settings =
    Just4FunSettings(players = 2, cards = j4f_cards_settings, board = j4f_board_settings)

mini_j4f_nc_nf_nm_settings = Just4FunSettings(
    players = 2,
    cards = nothing,
    board = BoardSettings(
        value_distribution = Just4Fun.MINI_JUST4FUN_DEFAULT_ORIGINAL_DIST,
        length_win = Just4Fun.MINI_JUST4FUN_DEFAULT_WIN_LENGTH,
        # with no multi stones, the game ends latest with the last stone, so the
        # stones must not be more than the fields!
        num_pieces = length(Just4Fun.MINI_JUST4FUN_DEFAULT_ORIGINAL_DIST) / 2,
        single_piece = true,
        count_values = false,
    ),
)
mini_j4f_nc_nf_nm_spec = Just4FunSpec(Player(YELLOW), mini_j4f_nc_nf_nm_settings)

mini_j4f_nc_nf_settings = Just4FunSettings(
    players = 2,
    cards = nothing,
    board = BoardSettings(
        value_distribution = Just4Fun.MINI_JUST4FUN_DEFAULT_ORIGINAL_DIST,
        length_win = Just4Fun.MINI_JUST4FUN_DEFAULT_WIN_LENGTH,
        num_pieces = Just4Fun.MINI_JUST4FUN_DEFAULT_NUM_PLAYER_STONES,
        single_piece = false,
        count_values = false,
    ),
)
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

j4f_board_settings = BoardSettings(
    value_distribution = Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST,
    length_win = Just4Fun.JUST4FUN_DEFAULT_WIN_LENGTH,
    num_pieces = Just4Fun.JUST4FUN_DEFAULT_NUM_PLAYER_STONES,
    single_piece = false,
    count_values = true,
)
j4f_nc_nf_nm_settings = Just4FunSettings(
    players = 2,
    cards = nothing,
    board = BoardSettings(
        value_distribution = Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST,
        length_win = Just4Fun.JUST4FUN_DEFAULT_WIN_LENGTH,
        num_pieces = 18,
        single_piece = true,
        count_values = false,
    ),
)

connect4_nc_nf_nm_settings = Just4FunSettings(
    players = 2,
    cards = nothing,
    board = BoardSettings(
        value_distribution = [
            1  7 13 19 25 31 ;
            2  8 14 20 26 32 ;
            3  9 15 21 27 33 ;
            4 10 16 22 28 34 ;
            5 11 17 23 29 35 ;
            6 12 18 24 30 36
        ],
        length_win = Just4Fun.JUST4FUN_DEFAULT_WIN_LENGTH,
        num_pieces = 18,
        single_piece = true,
        count_values = false,
    ),
)

j4f_nc_nf_settings = Just4FunSettings(
    players = 2,
    cards = nothing,
    board = BoardSettings(
        value_distribution = JUST4FUN_DEFAULT_ORIGINAL_DIST,
        length_win = JUST4FUN_DEFAULT_WIN_LENGTH,
        num_pieces = JUST4FUN_DEFAULT_NUM_PLAYER_STONES,
        single_piece = true,
        count_values = true,
    ),
)

j4f_nf_nm_settings = Just4FunSettings(
    players = 2,
    cards = j4f_cards_settings,
    board = BoardSettings(
        value_distribution = JUST4FUN_DEFAULT_ORIGINAL_DIST,
        length_win = JUST4FUN_DEFAULT_WIN_LENGTH,
        num_pieces = 18,
        single_piece = true,
        count_values = false,
    ),
)


export Just4FunSpec,
    Just4FunEnv,
    Just4FunEnvState,
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
