
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
############################
#### j4f
########
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
        num_pieces = round(length(JUST4FUN_DEFAULT_ORIGINAL_DIST) / 2, RoundNearest),
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
        num_pieces = round(36 / 2, RoundNearest),
        single_piece = true,
        count_values = false,
    ),
)

j4f_nc_nm_settings = Just4FunSettings(
    players = 2,
    cards = nothing,
    board = BoardSettings(
        value_distribution = Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST,
        length_win = Just4Fun.JUST4FUN_DEFAULT_WIN_LENGTH,
        num_pieces = round(length(JUST4FUN_DEFAULT_ORIGINAL_DIST) / 2, RoundNearest),
        single_piece = true,
        count_values = true,
    ),
)

j4f_nc_nf_settings = Just4FunSettings(
    players = 2,
    cards = nothing,
    board = BoardSettings(
        value_distribution = JUST4FUN_DEFAULT_ORIGINAL_DIST,
        length_win = JUST4FUN_DEFAULT_WIN_LENGTH,
        num_pieces = JUST4FUN_DEFAULT_NUM_PLAYER_STONES,
        single_piece = false,
        count_values = false,
    ),
)

j4f_nf_nm_settings = Just4FunSettings(
    players = 2,
    cards = j4f_cards_settings,
    board = BoardSettings(
        value_distribution = JUST4FUN_DEFAULT_ORIGINAL_DIST,
        length_win = JUST4FUN_DEFAULT_WIN_LENGTH,
        num_pieces = round(length(JUST4FUN_DEFAULT_ORIGINAL_DIST) / 2, RoundNearest),
        single_piece = true,
        count_values = false,
    ),
)

j4f_nf_settings = Just4FunSettings(
    players = 2,
    cards = j4f_cards_settings,
    board = BoardSettings(
        value_distribution = JUST4FUN_DEFAULT_ORIGINAL_DIST,
        length_win = JUST4FUN_DEFAULT_WIN_LENGTH,
        num_pieces = JUST4FUN_DEFAULT_NUM_PLAYER_STONES,
        single_piece = false,
        count_values = false,
    ),
)

j4f_nm_settings = Just4FunSettings(
    players = 2,
    cards = j4f_cards_settings,
    board = BoardSettings(
        value_distribution = JUST4FUN_DEFAULT_ORIGINAL_DIST,
        length_win = JUST4FUN_DEFAULT_WIN_LENGTH,
        num_pieces = length(JUST4FUN_DEFAULT_ORIGINAL_DIST) / 2,
        single_piece = true,
        count_values = true,
    ),
)