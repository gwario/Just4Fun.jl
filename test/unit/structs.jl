@test CardsSettings().size_hand == Just4Fun.JUST4FUN_DEFAULT_SIZE_HAND
@test CardsSettings().deck == Just4Fun.JUST4FUN_DEFAULT_DECK

@test BoardSettings().value_distribution == Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST
@test BoardSettings().length_win == Just4Fun.JUST4FUN_DEFAULT_WIN_LENGTH
@test BoardSettings().num_pieces == Just4Fun.JUST4FUN_DEFAULT_NUM_PLAYER_STONES
@test BoardSettings().single_piece == false
@test BoardSettings().count_values == true

@test Just4FunSettings().players == 2
@test Just4FunSettings().cards.size_hand == Just4Fun.JUST4FUN_DEFAULT_SIZE_HAND
@test Just4FunSettings().cards.deck == Just4Fun.JUST4FUN_DEFAULT_DECK
@test Just4FunSettings().board.value_distribution == Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST
@test Just4FunSettings().board.length_win == Just4Fun.JUST4FUN_DEFAULT_WIN_LENGTH
@test Just4FunSettings().board.num_pieces == Just4Fun.JUST4FUN_DEFAULT_NUM_PLAYER_STONES
@test Just4FunSettings().board.single_piece == false
@test Just4FunSettings().board.count_values == true

@test Just4FunSpec().settings.players == 2
@test Just4FunSpec().settings.cards.size_hand == Just4Fun.JUST4FUN_DEFAULT_SIZE_HAND
@test Just4FunSpec().settings.cards.deck == Just4Fun.JUST4FUN_DEFAULT_DECK
@test Just4FunSpec().settings.board.value_distribution == Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST
@test Just4FunSpec().settings.board.length_win == Just4Fun.JUST4FUN_DEFAULT_WIN_LENGTH
@test Just4FunSpec().settings.board.num_pieces == Just4Fun.JUST4FUN_DEFAULT_NUM_PLAYER_STONES
@test Just4FunSpec().settings.board.single_piece == false
@test Just4FunSpec().settings.board.count_values == true