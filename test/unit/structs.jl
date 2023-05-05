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

@testset "generate_card_actions" begin
    @testset "field values order has no impact" begin
        settings1 = Just4FunSettings(
            cards = CardsSettings(deck = reverse([1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3])),
        )
        settings2 = Just4FunSettings(
            cards = CardsSettings(deck = [1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3]),
        )
        actions1 = Just4Fun.generate_card_actions(settings1)
        actions2 = Just4Fun.generate_card_actions(settings2)
        @test length(actions1) == length(actions2)
        for (i, a1) in enumerate(actions1)
            @test Just4Fun.to_field_value(a1) == Just4Fun.to_field_value(actions2[i])
        end
        for (i, a1) in enumerate(actions1)
            @test a1.cards == actions2[i].cards
        end
    end
end
######
@testset "generate_nocard_actions" begin
    settings1 = Just4FunSettings(
        cards = nothing,
        board = BoardSettings(
            value_distribution = [
                24 5 19 10   9 25 ;
                29 30  3 16 18 35 ;
                11  1 36 20 31  6 ;
                34  7  8 15 23  4 ;
                26 22 13 14 27  2 ;
                12 32 17 33 21 28
            ],
        ),
    )
    actions1 = Just4Fun.generate_nocard_actions(settings1)
    @test actions1[1:4] == [FieldValue(1), FieldValue(2), FieldValue(3), FieldValue(4)]

    settings2 = Just4FunSettings(
        cards = nothing,
        board = BoardSettings(
            value_distribution = [
                02 5 19 10   9 25 ;
                29 30  3 16 18 35 ;
                11  1 36 20  7  6 ;
                34 31  8 15 23  4 ;
                26 22 13 14 27 24 ;
                12 32 17 33 21 28
            ],
        ),
    )
    actions2 = Just4Fun.generate_nocard_actions(settings2)
    @test actions2[1:4] == [FieldValue(1), FieldValue(2), FieldValue(3), FieldValue(4)]
    @test length(actions1) == length(actions2)
    for (i, a1) in enumerate(actions1)
        @test Just4Fun.to_field_value(a1) == Just4Fun.to_field_value(actions2[i])
    end
end