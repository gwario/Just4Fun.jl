
@testset "dominant_player" begin

    @test Just4Fun.dominant_player(SVector(FieldValue(0), FieldValue(0))) != Player(YELLOW)
    @test Just4Fun.dominant_player(SVector(FieldValue(0), FieldValue(0))) != Player(RED)
    @test Just4Fun.dominant_player(SVector(FieldValue(0), FieldValue(0))) != Player(GREEN)
    @test Just4Fun.dominant_player(SVector(FieldValue(0), FieldValue(0))) != Player(MAGENTA)

    @test Just4Fun.dominant_player(SVector(FieldValue(1), FieldValue(1))) != Player(YELLOW)
    @test Just4Fun.dominant_player(SVector(FieldValue(1), FieldValue(1))) != Player(RED)
    @test Just4Fun.dominant_player(SVector(FieldValue(1), FieldValue(1))) != Player(GREEN)
    @test Just4Fun.dominant_player(SVector(FieldValue(1), FieldValue(1))) != Player(MAGENTA)

    ##

    @test Just4Fun.dominant_player(SVector(FieldValue(1), FieldValue(0))) != Player(YELLOW)
    @test Just4Fun.dominant_player(SVector(FieldValue(1), FieldValue(0))) != Player(RED)
    @test Just4Fun.dominant_player(SVector(FieldValue(1), FieldValue(0))) != Player(GREEN)
    @test Just4Fun.dominant_player(SVector(FieldValue(1), FieldValue(0))) != Player(MAGENTA)

    @test Just4Fun.dominant_player(SVector(FieldValue(2), FieldValue(0))) == Player(YELLOW)
    @test Just4Fun.dominant_player(SVector(FieldValue(3), FieldValue(1))) == Player(YELLOW)
    @test Just4Fun.dominant_player(SVector(FieldValue(4), FieldValue(2))) == Player(YELLOW)

    ##

    @test Just4Fun.dominant_player(SVector(FieldValue(0), FieldValue(1))) != Player(YELLOW)
    @test Just4Fun.dominant_player(SVector(FieldValue(0), FieldValue(1))) != Player(RED)
    @test Just4Fun.dominant_player(SVector(FieldValue(0), FieldValue(1))) != Player(GREEN)
    @test Just4Fun.dominant_player(SVector(FieldValue(0), FieldValue(1))) != Player(MAGENTA)

    @test Just4Fun.dominant_player(SVector(FieldValue(0), FieldValue(2))) == Player(RED)
    @test Just4Fun.dominant_player(SVector(FieldValue(1), FieldValue(3))) == Player(RED)
    @test Just4Fun.dominant_player(SVector(FieldValue(2), FieldValue(4))) == Player(RED)

end

#######

@testset "is_available" begin

    @test Just4Fun.is_available(SVector(FieldValue(0), FieldValue(0)), Player(YELLOW))
    @test Just4Fun.is_available(SVector(FieldValue(0), FieldValue(0)), Player(RED))
    @test Just4Fun.is_available(
        SVector(FieldValue(0), FieldValue(0), FieldValue(0), FieldValue(0)),
        Player(GREEN),
    )
    @test Just4Fun.is_available(
        SVector(FieldValue(0), FieldValue(0), FieldValue(0), FieldValue(0)),
        Player(MAGENTA),
    )
    ##
    @test Just4Fun.is_available(SVector(FieldValue(1), FieldValue(1)), Player(YELLOW))
    @test Just4Fun.is_available(SVector(FieldValue(1), FieldValue(1)), Player(RED))
    @test Just4Fun.is_available(
        SVector(FieldValue(1), FieldValue(1), FieldValue(1), FieldValue(1)),
        Player(GREEN),
    )
    @test Just4Fun.is_available(
        SVector(FieldValue(1), FieldValue(1), FieldValue(1), FieldValue(1)),
        Player(MAGENTA),
    )
    ##
    @test Just4Fun.is_available(SVector(FieldValue(1), FieldValue(0)), Player(YELLOW))
    @test Just4Fun.is_available(SVector(FieldValue(1), FieldValue(0)), Player(RED))
    @test Just4Fun.is_available(
        SVector(FieldValue(1), FieldValue(0), FieldValue(0), FieldValue(0)),
        Player(GREEN),
    )
    @test Just4Fun.is_available(
        SVector(FieldValue(1), FieldValue(0), FieldValue(0), FieldValue(0)),
        Player(MAGENTA),
    )
    ##
    @test Just4Fun.is_available(SVector(FieldValue(0), FieldValue(1)), Player(YELLOW))
    @test Just4Fun.is_available(SVector(FieldValue(0), FieldValue(1)), Player(RED))
    @test Just4Fun.is_available(
        SVector(FieldValue(0), FieldValue(1), FieldValue(0), FieldValue(0)),
        Player(GREEN),
    )
    @test Just4Fun.is_available(
        SVector(FieldValue(0), FieldValue(1), FieldValue(0), FieldValue(0)),
        Player(MAGENTA),
    )
    ##
    @test Just4Fun.is_available(SVector(FieldValue(2), FieldValue(0)), Player(YELLOW)) ==
          false
    @test Just4Fun.is_available(SVector(FieldValue(2), FieldValue(0)), Player(RED)) == false
    @test Just4Fun.is_available(
        SVector(FieldValue(2), FieldValue(0), FieldValue(0), FieldValue(0)),
        Player(GREEN),
    ) == false
    @test Just4Fun.is_available(
        SVector(FieldValue(2), FieldValue(0), FieldValue(0), FieldValue(0)),
        Player(MAGENTA),
    ) == false
    ##
    @test Just4Fun.is_available(SVector(FieldValue(0), FieldValue(2)), Player(YELLOW)) ==
          false
    @test Just4Fun.is_available(SVector(FieldValue(0), FieldValue(2)), Player(RED)) == false
    @test Just4Fun.is_available(
        SVector(FieldValue(0), FieldValue(2), FieldValue(0), FieldValue(0)),
        Player(GREEN),
    ) == false
    @test Just4Fun.is_available(
        SVector(FieldValue(0), FieldValue(2), FieldValue(0), FieldValue(0)),
        Player(MAGENTA),
    ) == false
    ##
    @test Just4Fun.is_available(SVector(FieldValue(2), FieldValue(4)), Player(RED)) == false
    ##
    @test Just4Fun.is_available(SVector(FieldValue(2), FieldValue(4)), Player(YELLOW)) ==
          false
    ##
    @test Just4Fun.is_available(
        SVector(FieldValue(2), FieldValue(4), FieldValue(2), FieldValue(4)),
        Player(YELLOW),
    ) == false
    @test Just4Fun.is_available(
        SVector(FieldValue(2), FieldValue(4), FieldValue(2), FieldValue(4)),
        Player(RED),
    ) == true
    @test Just4Fun.is_available(
        SVector(FieldValue(2), FieldValue(4), FieldValue(2), FieldValue(4)),
        Player(GREEN),
    ) == true
    @test Just4Fun.is_available(
        SVector(FieldValue(2), FieldValue(4), FieldValue(2), FieldValue(4)),
        Player(MAGENTA),
    ) == false
end

# TODO: add test for fields_reachability

#######

@testset "take_stone!" begin

    @testset "yellow" begin
        spec = Just4Fun.j4f_spec
        GI.spec(::Just4FunEnv) = spec
        game = GI.init(spec)
        initial_stones = spec.settings.board.num_pieces
        game.curplayer = Player(YELLOW)
        # precondition  
        @test game.player_stones ==
              SVector(FieldValue(initial_stones), FieldValue(initial_stones))
        Just4Fun.take_stone!(game)
        @test game.player_stones ==
              SVector(FieldValue(initial_stones - 1), FieldValue(initial_stones))
        Just4Fun.take_stone!(game)
        @test game.player_stones ==
              SVector(FieldValue(initial_stones - 2), FieldValue(initial_stones))
        Just4Fun.take_stone!(game)
        @test game.player_stones ==
              SVector(FieldValue(initial_stones - 3), FieldValue(initial_stones))
    end

    @testset "red" begin
        spec = Just4Fun.j4f_spec
        GI.spec(::Just4FunEnv) = spec
        game = GI.init(spec)
        initial_stones = spec.settings.board.num_pieces
        game.curplayer = Player(RED)
        # precondition
        @test game.player_stones ==
              SVector(FieldValue(initial_stones), FieldValue(initial_stones))
        Just4Fun.take_stone!(game)
        @test game.player_stones ==
              SVector(FieldValue(initial_stones), FieldValue(initial_stones - 1))
        Just4Fun.take_stone!(game)
        @test game.player_stones ==
              SVector(FieldValue(initial_stones), FieldValue(initial_stones - 2))
        Just4Fun.take_stone!(game)
        @test game.player_stones ==
              SVector(FieldValue(initial_stones), FieldValue(initial_stones - 3))
    end

    @testset "both" begin
        spec = Just4Fun.j4f_spec
        GI.spec(::Just4FunEnv) = spec
        game = GI.init(spec)
        initial_stones = spec.settings.board.num_pieces
        game.curplayer = Player(RED)
        # precondition
        @test game.player_stones ==
              SVector(FieldValue(initial_stones), FieldValue(initial_stones))
        Just4Fun.take_stone!(game)
        @test game.player_stones ==
              SVector(FieldValue(initial_stones), FieldValue(initial_stones - 1))
        game.curplayer = Player(YELLOW)
        Just4Fun.take_stone!(game)
        @test game.player_stones ==
              SVector(FieldValue(initial_stones - 1), FieldValue(initial_stones - 1))
    end
end
#######
@testset "place_stone!+get_stones" begin
    spec = Just4Fun.j4f_spec
    GI.spec(::Just4FunEnv) = spec
    game = GI.init(spec)
    game.curplayer = Player(YELLOW)
    # precondition
    @test Just4Fun.get_stones(spec, game, FieldValue(1)) ==
          SVector(FieldValue(0), FieldValue(0))
    @test Just4Fun.get_stones(spec, game, FieldValue(2)) ==
          SVector(FieldValue(0), FieldValue(0))
    Just4Fun.place_stone!(spec, game, FieldValue(1))
    @test Just4Fun.get_stones(spec, game, FieldValue(1)) ==
          SVector(FieldValue(1), FieldValue(0))
    Just4Fun.place_stone!(spec, game, FieldValue(1))
    @test Just4Fun.get_stones(spec, game, FieldValue(1)) ==
          SVector(FieldValue(2), FieldValue(0))
    game.curplayer = Player(RED)
    Just4Fun.place_stone!(spec, game, FieldValue(2))
    @test Just4Fun.get_stones(spec, game, FieldValue(1)) ==
          SVector(FieldValue(2), FieldValue(0))
    @test Just4Fun.get_stones(spec, game, FieldValue(2)) ==
          SVector(FieldValue(0), FieldValue(1))
    Just4Fun.place_stone!(spec, game, FieldValue(2))
    @test Just4Fun.get_stones(spec, game, FieldValue(1)) ==
          SVector(FieldValue(2), FieldValue(0))
    @test Just4Fun.get_stones(spec, game, FieldValue(2)) ==
          SVector(FieldValue(0), FieldValue(2))
end

########

@testset "put_down!" begin
    player_index = Just4Fun.to_index(YELLOW)
    spec = Just4Fun.j4f_spec
    GI.spec(::Just4FunEnv) = spec
    game = GI.init(spec)
    game.player_cards =
        setindex(game.player_cards, CardValue(1), CartesianIndex(1, player_index))
    game.player_cards =
        setindex(game.player_cards, CardValue(2), CartesianIndex(2, player_index))
    game.player_cards =
        setindex(game.player_cards, CardValue(3), CartesianIndex(3, player_index))
    game.player_cards =
        setindex(game.player_cards, CardValue(4), CartesianIndex(4, player_index))
    # precondition
    @test game.player_cards[:, player_index] ==
          [CardValue(1), CardValue(2), CardValue(3), CardValue(4)]

    Just4Fun.put_down!(Just4Fun.j4f_spec, game, Cards([CardValue(4), CardValue(2)]))

    @test game.used_cards == [CardValue(4), CardValue(2)]
    @test game.player_cards[:, player_index] ==
          SVector(CardValue(1), CardValue(0), CardValue(3), CardValue(0))
end
########
@testset "pick_cards! both" begin
    stack = Stack{CardValue}()

    push!(stack, CardValue(7)) # p2
    push!(stack, CardValue(5)) # p2

    push!(stack, CardValue(6)) # p1

    push!(stack, CardValue(3)) # p2

    push!(stack, CardValue(4)) # p1
    push!(stack, CardValue(2)) # p1
    # ----------------------------------------
    push!(stack, CardValue(1)) # p2
    push!(stack, CardValue(2)) # p1
    push!(stack, CardValue(1)) # p2
    push!(stack, CardValue(2)) # p1
    push!(stack, CardValue(1)) # p2
    push!(stack, CardValue(2)) # p1
    push!(stack, CardValue(1)) # p2
    push!(stack, CardValue(2)) # p1

    spec = Just4FunSpec(stack, Player(YELLOW), Just4Fun.j4f_settings)

    @test length(stack) == 14

    GI.spec(::Just4FunEnv) = spec
    game = GI.init(spec)

    # the first 8 cards have been picked on init
    @test game.player_cards == @SMatrix [
        CardValue(2) CardValue(1)
        CardValue(2) CardValue(1)
        CardValue(2) CardValue(1)
        CardValue(2) CardValue(1)
    ]

    # establish precondition
    game.player_cards = setindex(game.player_cards, CardValue(0), CartesianIndex(2, 1)) # p1, card 2
    game.player_cards = setindex(game.player_cards, CardValue(0), CartesianIndex(3, 1)) # p1, card 3
    game.player_cards = setindex(game.player_cards, CardValue(0), CartesianIndex(4, 1)) # p1, card 4
    game.player_cards = setindex(game.player_cards, CardValue(0), CartesianIndex(1, 2)) # p1, card 1
    game.player_cards = setindex(game.player_cards, CardValue(0), CartesianIndex(3, 2)) # p1, card 3
    game.player_cards = setindex(game.player_cards, CardValue(0), CartesianIndex(4, 2)) # p1, card 4

    @test game.player_cards == @SMatrix [
        CardValue(2) CardValue(0)
        CardValue(0) CardValue(1)
        CardValue(0) CardValue(0)
        CardValue(0) CardValue(0)
    ]

    @test length(game.stack) == 6
    @test game.curplayer == Player(YELLOW)

    Just4Fun.pick_cards!(spec, game, 2) # p1 gets 2 and 4 at first free positions which are 2 and 3 

    # post-conditions
    @test length(game.stack) == 4

    @test game.player_cards == @SMatrix [
        CardValue(2) CardValue(0)
        CardValue(2) CardValue(1)
        CardValue(4) CardValue(0)
        CardValue(0) CardValue(0)
    ]

    game.curplayer = Player(RED)
    @test game.curplayer == Player(RED)

    Just4Fun.pick_cards!(spec, game, 1) # p2 gets 3 at first free positions which is 1 

    # post-conditions
    @test length(game.stack) == 3

    @test game.player_cards == @SMatrix [
        CardValue(2) CardValue(3)
        CardValue(2) CardValue(1)
        CardValue(4) CardValue(0)
        CardValue(0) CardValue(0)
    ]

    game.curplayer = Player(YELLOW)
    @test game.curplayer == Player(YELLOW)

    Just4Fun.pick_cards!(spec, game, 1) # p1 gets 6 at first free position which is 4

    # post-conditions
    @test length(game.stack) == 2

    @test game.player_cards == @SMatrix [
        CardValue(2) CardValue(3)
        CardValue(2) CardValue(1)
        CardValue(4) CardValue(0)
        CardValue(6) CardValue(0)
    ]

    game.curplayer = Player(RED)
    @test game.curplayer == Player(RED)

    Just4Fun.pick_cards!(spec, game, 2) # p2 gets 5 and 7 at first free positions which are 3 and 4

    # post-conditions
    @test length(game.stack) == 0

    @test game.player_cards == @SMatrix [
        CardValue(2) CardValue(3)
        CardValue(2) CardValue(1)
        CardValue(4) CardValue(5)
        CardValue(6) CardValue(7)
    ]
end
##########
@testset "empty_field" begin
    @test Just4Fun.empty_field(SVector{2,Stones}(zeros(Stones, 2))) == true
    @test Just4Fun.empty_field(SVector{2,Stones}(ones(Stones, 2))) == false
    @test Just4Fun.empty_field(SVector{3,Stones}(0x0, 0x1, 0x0)) == false
    @test Just4Fun.empty_field(SVector{3,Stones}(0x2, 0x1, 0x1)) == false
    @test Just4Fun.empty_field(SVector{3,Stones}(0x0, 0x0, 0x0)) == true
    @test Just4Fun.empty_field(SVector{3,Stones}(zeros(Stones, 3))) == true
    @test Just4Fun.empty_field(SVector{3,Stones}(ones(Stones, 3))) == false
    @test Just4Fun.empty_field(SVector{4,Stones}(zeros(Stones, 4))) == true
    @test Just4Fun.empty_field(SVector{4,Stones}(ones(Stones, 4))) == false
end

##########

@testset "next_player" begin
    @testset "default (2 player)" begin
        # two players default
        spec2 = Just4Fun.j4f_spec
        @test Just4Fun.next_player(spec2, Player(YELLOW)) == Player(RED)
        @test Just4Fun.next_player(spec2, Player(RED)) == Player(YELLOW)
    end

    @testset "3 player" begin
        spec3 = Just4FunSpec(
            nothing,
            Just4FunSettings(players = 3, board = BoardSettings(), cards = nothing),
        )

        @test Just4Fun.next_player(spec3, Player(YELLOW)) == Player(RED)
        @test Just4Fun.next_player(spec3, Player(RED)) == Player(MAGENTA)
        @test Just4Fun.next_player(spec3, Player(MAGENTA)) == Player(YELLOW)
    end

    @testset "4 player" begin
        spec4 = Just4FunSpec(
            nothing,
            Just4FunSettings(players = 4, board = BoardSettings(), cards = nothing),
        )

        @test Just4Fun.next_player(spec4, Player(YELLOW)) == Player(RED)
        @test Just4Fun.next_player(spec4, Player(RED)) == Player(MAGENTA)
        @test Just4Fun.next_player(spec4, Player(MAGENTA)) == Player(GREEN)
        @test Just4Fun.next_player(spec4, Player(GREEN)) == Player(YELLOW)
    end
end

##########

@testset "previous_player" begin
    @testset "default (2 player)" begin
        # two players default
        spec2 = Just4Fun.j4f_spec
        @test Just4Fun.previous_player(spec2, Player(YELLOW)) == Player(RED)
        @test Just4Fun.previous_player(spec2, Player(RED)) == Player(YELLOW)
    end

    @testset "3 player" begin
        spec3 = Just4FunSpec(nothing, Just4FunSettings(players = 3))

        @test Just4Fun.previous_player(spec3, Player(YELLOW)) == Player(MAGENTA)
        @test Just4Fun.previous_player(spec3, Player(RED)) == Player(YELLOW)
        @test Just4Fun.previous_player(spec3, Player(MAGENTA)) == Player(RED)
    end
    @testset "4 player" begin
        spec4 = Just4FunSpec(nothing, Just4FunSettings(players = 4))

        @test Just4Fun.previous_player(spec4, Player(YELLOW)) == Player(GREEN)
        @test Just4Fun.previous_player(spec4, Player(RED)) == Player(YELLOW)
        @test Just4Fun.previous_player(spec4, Player(MAGENTA)) == Player(RED)
        @test Just4Fun.previous_player(spec4, Player(GREEN)) == Player(MAGENTA)
    end
end

##########

@testset "is_curplayer_index" begin
    spec = Just4Fun.j4f_spec
    GI.spec(::Just4FunEnv) = spec
    game = GI.init(spec)

    @test Just4Fun.is_curplayer_index(game, convert(Int64, YELLOW)) == true
    @test Just4Fun.is_curplayer_index(game, convert(Int64, RED)) == false
    @test Just4Fun.is_curplayer_index(game, convert(Int64, GREEN)) == false
    @test Just4Fun.is_curplayer_index(game, convert(Int64, MAGENTA)) == false
end

##########

@testset "curplayercards" begin
    stack = Stack{CardValue}()
    push!(stack, CardValue(1)) # p2
    push!(stack, CardValue(2)) # p1
    push!(stack, CardValue(1)) # p2
    push!(stack, CardValue(2)) # p1
    push!(stack, CardValue(1)) # p2
    push!(stack, CardValue(2)) # p1
    push!(stack, CardValue(1)) # p2
    push!(stack, CardValue(2)) # p1
    spec = Just4FunSpec(stack, Player(YELLOW), Just4Fun.j4f_settings)
    GI.spec(::Just4FunEnv) = spec
    game = GI.init(spec)
    @test game.curplayer == Player(YELLOW)
    @test Just4Fun.curplayercards(game) ==
          Cards([CardValue(2), CardValue(2), CardValue(2), CardValue(2)])
end
##########
@testset "playercards" begin
    stack = Stack{CardValue}()
    push!(stack, CardValue(1)) # p2
    push!(stack, CardValue(2)) # p1
    push!(stack, CardValue(1)) # p2
    push!(stack, CardValue(2)) # p1
    push!(stack, CardValue(1)) # p2
    push!(stack, CardValue(2)) # p1
    push!(stack, CardValue(1)) # p2
    push!(stack, CardValue(2)) # p1
    spec = Just4FunSpec(stack, Player(YELLOW), Just4Fun.j4f_settings)
    GI.spec(::Just4FunEnv) = spec
    game = GI.init(spec)

    @test Just4Fun.playercards(game, Player(YELLOW)) ==
          Cards([CardValue(2), CardValue(2), CardValue(2), CardValue(2)])
    @test Just4Fun.playercards(game, Player(RED)) ==
          Cards([CardValue(1), CardValue(1), CardValue(1), CardValue(1)])
end
##########

@testset "valid_pos" begin
    @testset "4x4" begin
        spec = Just4FunSpec(
            nothing,
            Just4FunSettings(
                board=BoardSettings(
                    value_distribution=[
                        01  2  3  4 ;
                        05  6  7  8 ;
                        09 10 11 12 ;
                        13 14 15 16
                    ]
                )
            )
        )

        @test Just4Fun.valid_pos(spec, (1, 1)) == true
        @test Just4Fun.valid_pos(spec, (1, 2)) == true
        @test Just4Fun.valid_pos(spec, (1, 3)) == true
        @test Just4Fun.valid_pos(spec, (1, 4)) == true
        @test Just4Fun.valid_pos(spec, (2, 1)) == true
        @test Just4Fun.valid_pos(spec, (2, 2)) == true
        @test Just4Fun.valid_pos(spec, (2, 3)) == true
        @test Just4Fun.valid_pos(spec, (2, 4)) == true
        @test Just4Fun.valid_pos(spec, (3, 1)) == true
        @test Just4Fun.valid_pos(spec, (3, 2)) == true
        @test Just4Fun.valid_pos(spec, (3, 3)) == true
        @test Just4Fun.valid_pos(spec, (3, 4)) == true
        @test Just4Fun.valid_pos(spec, (4, 1)) == true
        @test Just4Fun.valid_pos(spec, (4, 2)) == true
        @test Just4Fun.valid_pos(spec, (4, 3)) == true
        @test Just4Fun.valid_pos(spec, (4, 4)) == true

        @test Just4Fun.valid_pos(spec, (0, 0)) == false
        @test Just4Fun.valid_pos(spec, (0, 1)) == false
        @test Just4Fun.valid_pos(spec, (0, 2)) == false
        @test Just4Fun.valid_pos(spec, (0, 3)) == false
        @test Just4Fun.valid_pos(spec, (0, 4)) == false

        @test Just4Fun.valid_pos(spec, (0, 0)) == false
        @test Just4Fun.valid_pos(spec, (1, 0)) == false
        @test Just4Fun.valid_pos(spec, (2, 0)) == false
        @test Just4Fun.valid_pos(spec, (3, 0)) == false
        @test Just4Fun.valid_pos(spec, (4, 0)) == false
        @test Just4Fun.valid_pos(spec, (5, 0)) == false

        @test Just4Fun.valid_pos(spec, (5, 1)) == false
        @test Just4Fun.valid_pos(spec, (5, 2)) == false
        @test Just4Fun.valid_pos(spec, (5, 3)) == false
        @test Just4Fun.valid_pos(spec, (5, 4)) == false
        @test Just4Fun.valid_pos(spec, (5, 5)) == false

        @test Just4Fun.valid_pos(spec, (1, 5)) == false
        @test Just4Fun.valid_pos(spec, (2, 5)) == false
        @test Just4Fun.valid_pos(spec, (3, 5)) == false
        @test Just4Fun.valid_pos(spec, (4, 5)) == false
        #@test valid_pos(spec, (5, 5)) == false
    end

    @testset "6x6 (original)" begin
        spec = Just4FunSpec(
            nothing,
            Just4FunSettings(
                board=BoardSettings(
                    value_distribution=[
                        01 14 30 24 19  8 ;
                        33 11  9 16 35 21 ;
                        06 27 31 20  3 12 ;
                        15 32  5 29 17 26 ;
                        22 10 18 36 25  2 ;
                        28  7 23  4 13 34 
                    ]
                )
            )
        )

        @test Just4Fun.valid_pos(spec, (1, 1)) == true
        @test Just4Fun.valid_pos(spec, (1, 2)) == true
        @test Just4Fun.valid_pos(spec, (1, 3)) == true
        @test Just4Fun.valid_pos(spec, (1, 4)) == true
        @test Just4Fun.valid_pos(spec, (1, 5)) == true
        @test Just4Fun.valid_pos(spec, (1, 6)) == true
        @test Just4Fun.valid_pos(spec, (2, 1)) == true
        @test Just4Fun.valid_pos(spec, (2, 2)) == true
        @test Just4Fun.valid_pos(spec, (2, 3)) == true
        @test Just4Fun.valid_pos(spec, (2, 4)) == true
        @test Just4Fun.valid_pos(spec, (2, 5)) == true
        @test Just4Fun.valid_pos(spec, (2, 6)) == true
        @test Just4Fun.valid_pos(spec, (3, 1)) == true
        @test Just4Fun.valid_pos(spec, (3, 2)) == true
        @test Just4Fun.valid_pos(spec, (3, 3)) == true
        @test Just4Fun.valid_pos(spec, (3, 4)) == true
        @test Just4Fun.valid_pos(spec, (3, 5)) == true
        @test Just4Fun.valid_pos(spec, (3, 6)) == true
        @test Just4Fun.valid_pos(spec, (4, 1)) == true
        @test Just4Fun.valid_pos(spec, (4, 2)) == true
        @test Just4Fun.valid_pos(spec, (4, 3)) == true
        @test Just4Fun.valid_pos(spec, (4, 4)) == true
        @test Just4Fun.valid_pos(spec, (4, 5)) == true
        @test Just4Fun.valid_pos(spec, (4, 6)) == true
        @test Just4Fun.valid_pos(spec, (5, 1)) == true
        @test Just4Fun.valid_pos(spec, (5, 2)) == true
        @test Just4Fun.valid_pos(spec, (5, 3)) == true
        @test Just4Fun.valid_pos(spec, (5, 4)) == true
        @test Just4Fun.valid_pos(spec, (5, 5)) == true
        @test Just4Fun.valid_pos(spec, (5, 6)) == true
        @test Just4Fun.valid_pos(spec, (6, 1)) == true
        @test Just4Fun.valid_pos(spec, (6, 2)) == true
        @test Just4Fun.valid_pos(spec, (6, 3)) == true
        @test Just4Fun.valid_pos(spec, (6, 4)) == true
        @test Just4Fun.valid_pos(spec, (6, 5)) == true
        @test Just4Fun.valid_pos(spec, (6, 6)) == true

        @test Just4Fun.valid_pos(spec, (0, 0)) == false
        @test Just4Fun.valid_pos(spec, (0, 1)) == false
        @test Just4Fun.valid_pos(spec, (0, 2)) == false
        @test Just4Fun.valid_pos(spec, (0, 3)) == false
        @test Just4Fun.valid_pos(spec, (0, 4)) == false
        @test Just4Fun.valid_pos(spec, (0, 5)) == false
        @test Just4Fun.valid_pos(spec, (0, 6)) == false

        @test Just4Fun.valid_pos(spec, (0, 0)) == false
        @test Just4Fun.valid_pos(spec, (1, 0)) == false
        @test Just4Fun.valid_pos(spec, (2, 0)) == false
        @test Just4Fun.valid_pos(spec, (3, 0)) == false
        @test Just4Fun.valid_pos(spec, (4, 0)) == false
        @test Just4Fun.valid_pos(spec, (5, 0)) == false
        @test Just4Fun.valid_pos(spec, (6, 0)) == false
        @test Just4Fun.valid_pos(spec, (7, 0)) == false

        @test Just4Fun.valid_pos(spec, (7, 1)) == false
        @test Just4Fun.valid_pos(spec, (7, 2)) == false
        @test Just4Fun.valid_pos(spec, (7, 3)) == false
        @test Just4Fun.valid_pos(spec, (7, 4)) == false
        @test Just4Fun.valid_pos(spec, (7, 5)) == false
        @test Just4Fun.valid_pos(spec, (7, 6)) == false
        @test Just4Fun.valid_pos(spec, (7, 7)) == false

        @test Just4Fun.valid_pos(spec, (1, 7)) == false
        @test Just4Fun.valid_pos(spec, (2, 7)) == false
        @test Just4Fun.valid_pos(spec, (3, 7)) == false
        @test Just4Fun.valid_pos(spec, (4, 7)) == false
        @test Just4Fun.valid_pos(spec, (5, 7)) == false
        @test Just4Fun.valid_pos(spec, (6, 7)) == false
        #@test valid_pos(spec, (7, 7)) == false
    end
end

##########

@testset "num_connected_dir" begin
    @testset "4x4" begin
        spec = Just4FunSpec(
            nothing,
            Just4FunSettings(
                board=BoardSettings(
                    value_distribution=[
                        01  2  3  4 ;
                        05  6  7  8 ;
                        09 10 11 12 ;
                        13 14 15 16
                    ]
                )
            )
        )
        
        field_stones = SArray{Tuple{4,4,2},Stones}(
            [
                # p1
                0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00;;;
                # p2
                0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00
            ],
        )

        # TODO: might be wrong since we put stone on 1 should increment by 1 and thus return 1
        for dir in [(1, 1), (0, 1), (1, 0), (1, -1)], player in [YELLOW, RED]
            @test Just4Fun.num_connected_dir(
                spec,
                field_stones,
                player,
                FieldValue(1),
                dir,
            ) == 0
        end

        field_stones = SArray{Tuple{4,4,2},Stones}(
            [
                # p1
                0x00 0x00 0x00 0x00; 0x00 0x01 0x00 0x00; 0x00 0x00 0x01 0x00; 0x00 0x00 0x00 0x01;;;
                # p2
                0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00
            ],
        )
        @test Just4Fun.num_connected_dir(
            spec,
            field_stones,
            YELLOW,
            FieldValue(1),
            (1, 1),
        ) == 3
        @test Just4Fun.num_connected_dir(
            spec,
            field_stones,
            YELLOW,
            FieldValue(1),
            (1, 0),
        ) == 0
        @test Just4Fun.num_connected_dir(
            spec,
            field_stones,
            YELLOW,
            FieldValue(1),
            (0, 1),
        ) == 0
        @test Just4Fun.num_connected_dir(
            spec,
            field_stones,
            YELLOW,
            FieldValue(1),
            (1, -1),
        ) == 0

        @test Just4Fun.num_connected_dir(
            spec,
            field_stones,
            RED,
            FieldValue(1),
            (1, 1),
        ) == 0
        @test Just4Fun.num_connected_dir(
            spec,
            field_stones,
            RED,
            FieldValue(1),
            (1, 0),
        ) == 0
        @test Just4Fun.num_connected_dir(
            spec,
            field_stones,
            RED,
            FieldValue(1),
            (0, 1),
        ) == 0
        @test Just4Fun.num_connected_dir(
            spec,
            field_stones,
            RED,
            FieldValue(1),
            (1, -1),
        ) == 0


        field_stones = SArray{Tuple{4,4,2},Stones}(
            [
                # p1
                0x01 0x01 0x01 0x01; 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00;;;
                # p2
                0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00
            ],
        )
        @test Just4Fun.num_connected_dir(
            spec,
            field_stones,
            YELLOW,
            FieldValue(1),
            (1, 1),
        ) == 0
        @test Just4Fun.num_connected_dir(
            spec,
            field_stones,
            YELLOW,
            FieldValue(1),
            (1, 0),
        ) == 0
        @test Just4Fun.num_connected_dir(
            spec,
            field_stones,
            YELLOW,
            FieldValue(1),
            (0, 1),
        ) == 3
        @test Just4Fun.num_connected_dir(
            spec,
            field_stones,
            YELLOW,
            FieldValue(1),
            (1, -1),
        ) == 0

        field_stones = SArray{Tuple{4,4,2},Stones}(
            [
                # p1
                0x01 0x00 0x01 0x00; 0x01 0x00 0x00 0x00; 0x01 0x00 0x00 0x00; 0x01 0x00 0x00 0x00;;;
                # p2
                0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00
            ],
        )
        @test Just4Fun.num_connected_dir(
            spec,
            field_stones,
            YELLOW,
            FieldValue(1),
            (1, 1),
        ) == 0
        @test Just4Fun.num_connected_dir(
            spec,
            field_stones,
            YELLOW,
            FieldValue(1),
            (1, 0),
        ) == 3
        @test Just4Fun.num_connected_dir(
            spec,
            field_stones,
            YELLOW,
            FieldValue(1),
            (0, 1),
        ) == 0
        @test Just4Fun.num_connected_dir(
            spec,
            field_stones,
            YELLOW,
            FieldValue(1),
            (1, -1),
        ) == 0

        field_stones = SArray{Tuple{4,4,2},Stones}(
            [
                # p1
                0x00 0x00 0x01 0x00; 0x01 0x00 0x01 0x00; 0x01 0x01 0x00 0x00; 0x00 0x00 0x00 0x00;;;
                # p2
                0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00
            ],
        )
        @test Just4Fun.num_connected_dir(
            spec,
            field_stones,
            YELLOW,
            FieldValue(4),
            (1, 1),
        ) == 0
        @test Just4Fun.num_connected_dir(
            spec,
            field_stones,
            YELLOW,
            FieldValue(4),
            (1, 0),
        ) == 0
        @test Just4Fun.num_connected_dir(
            spec,
            field_stones,
            YELLOW,
            FieldValue(4),
            (0, 1),
        ) == 0
        @test Just4Fun.num_connected_dir(
            spec,
            field_stones,
            YELLOW,
            FieldValue(4),
            (1, -1),
        ) == 2
    end
    @testset "6x6" begin
        spec = Just4FunSpec(
            nothing,
            Just4FunSettings(
                board=BoardSettings(
                    value_distribution=[
                        01  2  3  4  5  6 ;
                        07  8  9 10 11 12 ;
                        13 14 15 16 17 18 ;
                        19 20 21 22 23 24 ;
                        25 26 27 28 29 30 ;
                        31 32 33 34 35 36
                    ]
                )
            )
        )
        
        field_stones = SArray{Tuple{6,6,2},Stones}(
            [
                # p1
                0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00;;;
                # p2
                0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00
            ],
        )

        # TODO: might be wrong since we put stone on 1 should increment by 1 and thus return 1
        for dir in [(1, 1), (0, 1), (1, 0), (1, -1)], player in [YELLOW, RED]
            @test Just4Fun.num_connected_dir(
                spec,
                field_stones,
                player,
                FieldValue(1),
                dir,
            ) == 0
        end
        field_stones = SArray{Tuple{6,6,2},Stones}(
            [
                # p1
                0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x01 0x00 0x00 0x00 0x00; 0x00 0x00 0x01 0x00 0x00 0x00; 0x00 0x00 0x00 0x01 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00;;;
                # p2
                0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00
            ],
        )
        @test Just4Fun.num_connected_dir(
            spec,
            field_stones,
            YELLOW,
            FieldValue(1),
            (1, 1),
        ) == 3 # 4 might be correct
        @test Just4Fun.num_connected_dir(
            spec,
            field_stones,
            YELLOW,
            FieldValue(1),
            (1, 0),
        ) == 0
        @test Just4Fun.num_connected_dir(
            spec,
            field_stones,
            YELLOW,
            FieldValue(1),
            (0, 1),
        ) == 0
        @test Just4Fun.num_connected_dir(
            spec,
            field_stones,
            YELLOW,
            FieldValue(1),
            (1, -1),
        ) == 0
    end
end

##########

@testset "num_connected_axis" begin

    @testset "4x4" begin
        spec = Just4FunSpec(
            nothing,
            Just4FunSettings(
                board=BoardSettings(
                    value_distribution=[
                        01  2  3  4 ;
                        05  6  7  8 ;
                        09 10 11 12 ;
                        13 14 15 16
                    ]
                )
            )
        )

        field_stones = SArray{Tuple{4,4,2},Stones}(
            [
                # p1
                0x01 0x01 0x01 0x01;   # 1 1 1 1
                0x00 0x01 0x01 0x01;   # 0 1 1 1
                0x00 0x01 0x00 0x01;   # 0 1 0 1
                0x01 0x00 0x00 0x00;;; # 1 0 0 0
                # p2
                0x00 0x01 0x00 0x00;   # 0 1 0 0 
                0x00 0x00 0x00 0x00;   # 0 0 0 0 
                0x00 0x00 0x00 0x00;   # 0 0 0 0
                0x00 0x00 0x00 0x00    # 0 0 0 0
            ],
        )

        # p1 - on 4 - count majority on sec maj axis
        @test Just4Fun.num_connected_axis(
            spec,
            field_stones,
            YELLOW,
            FieldValue(4),
            (1, -1),
        ) == 3
        # p1 - on 4 - count majority on last col
        @test Just4Fun.num_connected_axis(
            spec,
            field_stones,
            YELLOW,
            FieldValue(4),
            (1, 0),
        ) == 2
        # p1 - on 4 - count majority on last col - 2 is prevented by p2 !!!!!
        @test Just4Fun.num_connected_axis(
            spec,
            field_stones,
            YELLOW,
            FieldValue(4),
            (0, -1),
        ) == 1

        # p1 - on 7 - prim axis - before blocked by p1
        @test Just4Fun.num_connected_axis(
            spec,
            field_stones,
            YELLOW,
            FieldValue(7),
            (1, 1),
        ) == 1
        # p1 - on 7 - sec axis - 2 before 1 after and one on 7
        @test Just4Fun.num_connected_axis(
            spec,
            field_stones,
            YELLOW,
            FieldValue(7),
            (1, -1),
        ) == 3
        # p1 - on 7 - vert - only below and on 7
        @test Just4Fun.num_connected_axis(
            spec,
            field_stones,
            YELLOW,
            FieldValue(7),
            (1, 0),
        ) == 1
        # p1 - on 7 - horiz
        @test Just4Fun.num_connected_axis(
            spec,
            field_stones,
            YELLOW,
            FieldValue(7),
            (0, 1),
        ) == 2
    end
    @testset "6x6" begin
        spec = Just4FunSpec(
            nothing,
            Just4FunSettings(
                board=BoardSettings(
                    value_distribution=[
                        01  2  3  4  5  6 ;
                        07  8  9 10 11 12 ;
                        13 14 15 16 17 18 ;
                        19 20 21 22 23 24 ;
                        25 26 27 28 29 30 ;
                        31 32 33 34 35 36
                    ]
                )
            )
        )

        field_stones = SArray{Tuple{6,6,2},Stones}(
            [
                # p1
                0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x01 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00;;;
                # p2
                0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x01 0x00; 0x00 0x00 0x00 0x01 0x01 0x00; 0x00 0x00 0x01 0x01 0x00 0x00; 0x00 0x01 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00
            ],
        )

        # p1 - on 26 - count majority on sec maj axis - prevented by p2
        @test Just4Fun.num_connected_axis(
            spec,
            field_stones,
            YELLOW,
            FieldValue(26),
            (1, -1),
        ) == 0
        # p2 - on 26 - count majority on sec maj axis - 4th prevented by p1
        @test Just4Fun.num_connected_axis(
            spec,
            field_stones,
            RED,
            FieldValue(26),
            (1, -1),
        ) == 3

        # p2 - on 21 - prim axis - nothing except for at 21
        @test Just4Fun.num_connected_axis(
            spec,
            field_stones,
            RED,
            FieldValue(21),
            (1, 1),
        ) == 0
        # p2 - on 21 - sec axis - before is blocked by p1
        @test Just4Fun.num_connected_axis(
            spec,
            field_stones,
            RED,
            FieldValue(21),
            (1, -1),
        ) == 2
        # p2 - on 21 - vert
        @test Just4Fun.num_connected_axis(
            spec,
            field_stones,
            RED,
            FieldValue(21),
            (1, 0),
        ) == 0
        # p2 - on 21 - horiz - not blocked by p1
        @test Just4Fun.num_connected_axis(
            spec,
            field_stones,
            RED,
            FieldValue(21),
            (0, 1),
        ) == 1
    end
end

##########

@testset "winning_pattern_at" begin
    @testset "4x4" begin
        spec = Just4FunSpec(
            nothing,
            Just4FunSettings(
                board=BoardSettings(
                    value_distribution=[
                        01  2  3  4 ;
                        05  6  7  8 ;
                        09 10 11 12 ;
                        13 14 15 16
                    ]
                )
            )
        )

        field_stones = SArray{Tuple{4,4,2},Stones}(
            [
                # p1
                0x01 0x01 0x01 0x01;   # 1 1 1 1
                0x00 0x01 0x01 0x01;   # 0 1 1 1
                0x00 0x01 0x00 0x01;   # 0 1 0 1
                0x01 0x01 0x00 0x00;;; # 1 0 0 0
                # p2
                0x00 0x01 0x00 0x00;   # 0 1 0 0 
                0x00 0x00 0x00 0x00;   # 0 0 0 0 
                0x00 0x00 0x00 0x00;   # 0 0 0 0
                0x00 0x00 0x00 0x00    # 0 0 0 0
            ],
        )

        # p1 - on 4 - sec maj axis
        @test Just4Fun.winning_pattern_at(spec, field_stones, YELLOW, FieldValue(4)) == true
        @test Just4Fun.winning_pattern_at(spec, field_stones, YELLOW, FieldValue(6)) == false
    end
    @testset "6x6" begin
        spec = Just4FunSpec(
            nothing,
            Just4FunSettings(
                board=BoardSettings(
                    value_distribution=[
                        01  2  3  4  5  6 ;
                        07  8  9 10 11 12 ;
                        13 14 15 16 17 18 ;
                        19 20 21 22 23 24 ;
                        25 26 27 28 29 30 ;
                        31 32 33 34 35 36
                    ]
                )
            )
        )
        
        field_stones = SArray{Tuple{6,6,2},Stones}(
            [
                # p1
                0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x01 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00;;;
                # p2
                0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x01 0x00; 0x00 0x00 0x00 0x01 0x01 0x00; 0x00 0x00 0x01 0x01 0x00 0x00; 0x00 0x01 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00
            ],
        )

        # p1 - on 11 - none
        @test Just4Fun.winning_pattern_at(spec, field_stones, YELLOW, FieldValue(11)) == false

        # p2 - on 11 - prevented by p1
        @test Just4Fun.winning_pattern_at(spec, field_stones, RED, FieldValue(11)) == false
        # p2 - on 16 - prevented by p1
        @test Just4Fun.winning_pattern_at(spec, field_stones, RED, FieldValue(16)) == false
        # p2 - on 21 - prevented by p1
        @test Just4Fun.winning_pattern_at(spec, field_stones, RED, FieldValue(21)) == false

        field_stones = SArray{Tuple{6,6,2},Stones}(
            [
                # p1
                0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x01 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00;;;
                # p2
                0x00 0x00 0x00 0x00 0x00 0x01; 0x00 0x00 0x00 0x00 0x01 0x00; 0x00 0x00 0x00 0x01 0x01 0x00; 0x00 0x00 0x01 0x01 0x00 0x00; 0x00 0x01 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00
            ],
        )

        # p2 - on 6 - sec maj axis
        @test Just4Fun.winning_pattern_at(spec, field_stones, RED, FieldValue(6)) == true
        # p2 - on 11 - sec maj axis
        @test Just4Fun.winning_pattern_at(spec, field_stones, RED, FieldValue(11)) == true
        # p2 - on 16 - sec maj axis
        @test Just4Fun.winning_pattern_at(spec, field_stones, RED, FieldValue(16)) == true
        # p2 - on 21 - sec maj axis
        @test Just4Fun.winning_pattern_at(spec, field_stones, RED, FieldValue(21)) == true

        # p1 - none
        @test Just4Fun.winning_pattern_at(spec, field_stones, YELLOW, FieldValue(6)) == false
        # p1 - none
        @test Just4Fun.winning_pattern_at(spec, field_stones, YELLOW, FieldValue(11)) == false
        # p1 - none
        @test Just4Fun.winning_pattern_at(spec, field_stones, YELLOW, FieldValue(16)) == false
        # p1 - none
        @test Just4Fun.winning_pattern_at(spec, field_stones, YELLOW, FieldValue(21)) == false
        # p1 - none
        @test Just4Fun.winning_pattern_at(spec, field_stones, YELLOW, FieldValue(26)) == false
    end
end

##########

@testset "update_actions_mask!" begin
    @testset "opponent dominated fields not available in action mask (FEATURE_CARDS=true)" begin
        stack = Stack{CardValue}()
        push!(stack, CardValue(1)) # p2
        push!(stack, CardValue(2)) # p1
        push!(stack, CardValue(1)) # p2
        push!(stack, CardValue(2)) # p1
        push!(stack, CardValue(1)) # p2
        push!(stack, CardValue(2)) # p1
        push!(stack, CardValue(1)) # p2
        push!(stack, CardValue(2)) # p1
        spec = Just4FunSpec(stack)
        GI.spec(::Just4FunSpec) = spec
        game = GI.init(spec)

        actions = GI.actions(spec)

        # preconditions
        @test sum(game.field_stones) == 0

        game.curplayer = Player(YELLOW)
        mask_yellow = GI.actions_mask(game)
        cards_yellow = Just4Fun.playercards(game, game.curplayer)
        regular_combs = Just4Fun.regular_combinations(spec, cards_yellow)

        game.curplayer = Player(RED)
        mask_red = GI.actions_mask(game)
        cards_red = Just4Fun.playercards(game, game.curplayer)
        regular_combs_red = Just4Fun.regular_combinations(spec, cards_red)

        for (action_card_comb, value) in actions

            mask_index = findfirst(isequal((cards = action_card_comb, value = value)), GI.actions(spec))
            
            # p1 combination: [2], [2 2], [2 2 2], [2 2 2 2]
            game.curplayer = YELLOW
            if action_card_comb in regular_combs
                @test GI.actions_mask(game)[mask_index] == true
            else
                @test GI.actions_mask(game)[mask_index] == false
            end

            # p2 combination: [1], [1 1], [1 1 1], [1 1 1 1]
            game.curplayer = Player(RED)
            if action_card_comb in regular_combs_red
                @test GI.actions_mask(game)[mask_index] == true
            else
                @test GI.actions_mask(game)[mask_index] == false
            end
        end

        mask_index = findfirst(isequal((cards = [0x1], value = 0x1)), GI.actions(spec))
        @test GI.actions_mask(game)[mask_index] == true

        # block YELLOW / p1 on field 1 by stone of RED
        game.curplayer = RED
        Just4Fun.place_stone!(spec, game, 0x1)
        Just4Fun.place_stone!(spec, game, 0x1)
        Just4Fun.update_action_mask!(spec, game)

        game.curplayer = YELLOW
        mask_index = findfirst(isequal((cards = [0x1], value = 0x1)), GI.actions(spec))
        @test GI.actions_mask(game)[mask_index] == 0x0 # false
    end
    
    @testset "opponent dominated fields not available in action mask (FEATURE_CARDS=false)" begin
        spec = Just4Fun.j4f_nc_spec
        GI.spec(::Just4FunSpec) = spec
        game = GI.init(spec)

        actions = GI.actions(spec)

        # preconditions
        @test sum(game.field_stones) == 0

        game.curplayer = Player(YELLOW)
        mask_yellow = GI.actions_mask(game)

        game.curplayer = Player(RED)
        mask_red = GI.actions_mask(game)

        # initially both players can place on every field
        for value in actions
            mask_index = findfirst(isequal(value), GI.actions(spec))

            game.curplayer = YELLOW
            @test GI.actions_mask(game)[mask_index] == true

            game.curplayer = Player(RED)
            @test GI.actions_mask(game)[mask_index] == true
        end

        # block YELLOW / p1 on field 1 by stone of RED
        game.curplayer = RED
        Just4Fun.place_stone!(spec, game, 0x1)
        Just4Fun.place_stone!(spec, game, 0x1)
        Just4Fun.update_action_mask!(spec, game)

        game.curplayer = YELLOW
        mask_index = findfirst(isequal(0x1), GI.actions(spec))
        @test GI.actions_mask(game)[mask_index] == false
    end

    @testset "self dominated fields not available in action mask (FEATURE_CARDS=true)" begin
        stack = Stack{CardValue}()
        push!(stack, CardValue(1)) # p2
        push!(stack, CardValue(2)) # p1
        push!(stack, CardValue(1)) # p2
        push!(stack, CardValue(2)) # p1
        push!(stack, CardValue(1)) # p2
        push!(stack, CardValue(2)) # p1
        push!(stack, CardValue(1)) # p2
        push!(stack, CardValue(2)) # p1
        spec = Just4FunSpec(stack)
        GI.spec(::Just4FunSpec) = spec
        game = GI.init(spec)

        actions = GI.actions(spec)

        # preconditions
        @test sum(game.field_stones) == 0

        game.curplayer = Player(YELLOW)
        mask_yellow = GI.actions_mask(game)
        cards_yellow = Just4Fun.playercards(game, game.curplayer)
        regular_combs = Just4Fun.regular_combinations(spec, cards_yellow)

        game.curplayer = Player(RED)
        mask_red = GI.actions_mask(game)
        cards_red = Just4Fun.playercards(game, game.curplayer)
        regular_combs_red = Just4Fun.regular_combinations(spec, cards_red)

        for (action_card_comb, value) in actions

            mask_index = findfirst(isequal((cards = action_card_comb, value = value)), GI.actions(spec))

            # p1 combination: [2], [2 2], [2 2 2], [2 2 2 2]
            game.curplayer = YELLOW
            if action_card_comb in regular_combs
                @test GI.actions_mask(game)[mask_index] == true
            else
                @test GI.actions_mask(game)[mask_index] == false
            end

            # p2 combination: [1], [1 1], [1 1 1], [1 1 1 1]
            game.curplayer = Player(RED)
            if action_card_comb in regular_combs_red
                @test GI.actions_mask(game)[mask_index] == true
            else
                @test GI.actions_mask(game)[mask_index] == false
            end
        end

        mask_index = findfirst(isequal((cards = [0x1], value = 0x1)), GI.actions(spec))
        @test GI.actions_mask(game)[mask_index] == true

        # block YELLOW / p1 on field 1 by stone of itself
        game.curplayer = YELLOW
        Just4Fun.place_stone!(spec, game, 0x1)
        Just4Fun.place_stone!(spec, game, 0x1)
        Just4Fun.update_action_mask!(spec, game)

        game.curplayer = YELLOW
        mask_index = findfirst(isequal((cards = [0x1], value = 0x1)), GI.actions(spec))
        @test GI.actions_mask(game)[mask_index] == 0x0 # false
    end

    @testset "self dominated fields not available in action mask (FEATURE_CARDS=false)" begin
        spec = Just4Fun.j4f_nc_spec
        GI.spec(::Just4FunSpec) = spec
        game = GI.init(spec)

        actions = GI.actions(spec)

        # preconditions
        @test sum(game.field_stones) == 0

        game.curplayer = Player(YELLOW)
        mask_yellow = GI.actions_mask(game)

        game.curplayer = Player(RED)
        mask_red = GI.actions_mask(game)

        # initially both players can place on every field
        for value in actions
            mask_index = findfirst(isequal(0x1), GI.actions(spec))

            game.curplayer = YELLOW
            @test GI.actions_mask(game)[mask_index] == true

            game.curplayer = Player(RED)
            @test GI.actions_mask(game)[mask_index] == true
        end

        # block YELLOW / p1 on field 1 by stone of itself
        game.curplayer = YELLOW
        Just4Fun.place_stone!(spec, game, 0x1)
        Just4Fun.place_stone!(spec, game, 0x1)
        Just4Fun.update_action_mask!(spec, game)

        game.curplayer = YELLOW
        mask_index = findfirst(isequal(0x1), GI.actions(spec))
        @test GI.actions_mask(game)[mask_index] == false
    end
end

##########

@testset "update_status!" begin
    @testset "after action (win) 1" begin
        spec = Just4Fun.j4f_spec
        GI.spec(::Just4FunEnv) = spec
        game = GI.init(spec)

        @test game.winner == Player(0)
        @test game.state == in_progress

        #make player yellow win
        #  1 14 30 24 19  8 ;
        # 33 11  9 16 35 21 ;
        #  6 27 31 20  3 12 ;
        # 15 32  5 29 17 26 ;
        # 22 10 18 36 25  2 ;
        # 28  7 23  4 13 34
        game.curplayer = RED
        Just4Fun.place_stone!(spec, game, FieldValue(1))
        game.curplayer = YELLOW
        Just4Fun.place_stone!(spec, game, FieldValue(1))
        Just4Fun.place_stone!(spec, game, FieldValue(1))
        Just4Fun.place_stone!(spec, game, FieldValue(11))
        Just4Fun.place_stone!(spec, game, FieldValue(31))
        Just4Fun.place_stone!(spec, game, FieldValue(29))

        Just4Fun.update_status!(spec, game, (cards = CardValue[], value = FieldValue(29)))

        @test game.winner == Player(YELLOW)
        @test game.state == end_by_pattern
    end

    @testset "after action (win) 2" begin
        spec = Just4Fun.j4f_spec
        GI.spec(::Just4FunEnv) = spec
        game = GI.init(spec)

        @test game.winner == Player(0)
        @test game.state == in_progress

        #make player yellow win
        #  1 14 30 24 19  8 ;
        # 33 11  9 16 35 21 ;
        #  6 27 31 20  3 12 ;
        # 15 32  5 29 17 26 ;
        # 22 10 18 36 25  2 ;
        # 28  7 23  4 13 34
        game.curplayer = RED
        Just4Fun.place_stone!(spec, game, FieldValue(1))
        game.curplayer = YELLOW
        Just4Fun.place_stone!(spec, game, FieldValue(1))
        Just4Fun.place_stone!(spec, game, FieldValue(11))
        Just4Fun.place_stone!(spec, game, FieldValue(31))
        Just4Fun.place_stone!(spec, game, FieldValue(29))

        Just4Fun.update_status!(spec, game, (cards = CardValue[], value = FieldValue(29)))

        @test game.winner == Player(0)
        @test game.state == in_progress

        Just4Fun.place_stone!(spec, game, FieldValue(1))

        Just4Fun.update_status!(spec, game, (cards = CardValue[], value = FieldValue(1)))

        @test game.winner == Player(YELLOW)
        @test game.state == end_by_pattern
    end

    @testset "after action (no win) 3" begin
        spec = Just4Fun.j4f_spec
        GI.spec(::Just4FunEnv) = spec
        game = GI.init(spec)

        @test game.winner == Player(0)
        @test game.state == in_progress

        #make player yellow win
        #  1 14 30 24 19  8 ;
        # 33 11  9 16 35 21 ;
        #  6 27 31 20  3 12 ;
        # 15 32  5 29 17 26 ;
        # 22 10 18 36 25  2 ;
        # 28  7 23  4 13 34
        game.curplayer = RED
        Just4Fun.place_stone!(spec, game, FieldValue(1))
        game.curplayer = YELLOW
        Just4Fun.place_stone!(spec, game, FieldValue(1))
        Just4Fun.place_stone!(spec, game, FieldValue(1))
        Just4Fun.place_stone!(spec, game, FieldValue(11))
        #place_stone!(spec, game, FieldValue(31)) 31 missing
        Just4Fun.place_stone!(spec, game, FieldValue(29))

        Just4Fun.update_status!(spec, game, (cards = CardValue[], value = FieldValue(31)))

        @test game.winner == Player(0)
        @test game.state == in_progress
    end

    @testset "action-independent (majority)" begin
        spec = Just4Fun.j4f_spec
        GI.spec(::Just4FunEnv) = spec
        game = GI.init(spec)

        @test game.winner == 0x0
        @test game.state == in_progress

        #make player yellow win
        #  1 14 30 24 19  8 ;
        # 33 11  9 16 35 21 ;
        #  6 27 31 20  3 12 ;
        # 15 32  5 29 17 26 ;
        # 22 10 18 36 25  2 ;
        # 28  7 23  4 13 34
        game.curplayer = RED
        Just4Fun.place_stone!(spec, game, FieldValue(1))
        game.curplayer = YELLOW
        Just4Fun.place_stone!(spec, game, FieldValue(1))
        Just4Fun.place_stone!(spec, game, FieldValue(1))
        Just4Fun.place_stone!(spec, game, FieldValue(11))
        Just4Fun.place_stone!(spec, game, FieldValue(31))
        Just4Fun.place_stone!(spec, game, FieldValue(29))

        Just4Fun.update_status!(spec, game)

        @test game.winner == YELLOW
        @test game.state == end_by_pattern
    end

    @testset "action-independent (no majority) 1" begin
        spec = Just4Fun.j4f_spec
        GI.spec(::Just4FunEnv) = spec
        game = GI.init(spec)

        @test game.winner == 0x0
        @test game.state == in_progress

        #make player yellow win
        #  1 14 30 24 19  8 ;
        # 33 11  9 16 35 21 ;
        #  6 27 31 20  3 12 ;
        # 15 32  5 29 17 26 ;
        # 22 10 18 36 25  2 ;
        # 28  7 23  4 13 34
        game.curplayer = RED
        Just4Fun.place_stone!(spec, game, FieldValue(1))
        game.curplayer = YELLOW
        Just4Fun.place_stone!(spec, game, FieldValue(1)) # 1 missing
        Just4Fun.place_stone!(spec, game, FieldValue(11))
        Just4Fun.place_stone!(spec, game, FieldValue(31))
        Just4Fun.place_stone!(spec, game, FieldValue(29))

        Just4Fun.update_status!(spec, game)

        @test game.winner == Player(0)
        @test game.state == in_progress
    end

    @testset "action-independent (no majority) 2" begin
        spec = Just4Fun.j4f_spec
        GI.spec(::Just4FunEnv) = spec
        game = GI.init(spec)

        @test game.winner == Player(0)
        @test game.state == in_progress

        #make player yellow win
        #  1 14 30 24 19  8 ;
        # 33 11  9 16 35 21 ;
        #  6 27 31 20  3 12 ;
        # 15 32  5 29 17 26 ;
        # 22 10 18 36 25  2 ;
        # 28  7 23  4 13 34
        game.curplayer = RED
        Just4Fun.place_stone!(spec, game, FieldValue(1))
        game.curplayer = YELLOW
        Just4Fun.place_stone!(spec, game, FieldValue(1))
        Just4Fun.place_stone!(spec, game, FieldValue(1))
        Just4Fun.place_stone!(spec, game, FieldValue(11))
        #place_stone!(spec, game, FieldValue(31)) 31 missing for connection
        Just4Fun.place_stone!(spec, game, FieldValue(29))

        Just4Fun.update_status!(spec, game)

        @test game.winner == Player(0)
        @test game.state == in_progress
    end

    @testset "curplayerstones" begin
        spec = Just4Fun.j4f_spec
        GI.spec(::Just4FunEnv) = spec
        game = GI.init(spec)
        game.player_stones = @SVector [Stones(1), Stones(2)]

        game.curplayer = Player(YELLOW)
        @test Just4Fun.curplayerstones(game) == Stones(1)
        game.curplayer = Player(RED)
        @test Just4Fun.curplayerstones(game) == Stones(2)
    end

    @testset "playerstones" begin
        spec = Just4Fun.j4f_spec
        game = GI.init(spec)
        game.player_stones = @SVector [Stones(1), Stones(2)]

        @test Just4Fun.playerstones(game, Player(YELLOW)) == Stones(1)
        @test Just4Fun.playerstones(game, Player(RED)) == Stones(2)
    end
end

##########

@testset "winner_by_numbers" begin

    @testset "draw (same number of stones)" begin
        spec = Just4Fun.j4f_spec
        GI.spec(::Just4FunEnv) = spec
        game = GI.init(spec)
        player1 = Player(YELLOW)
        player2 = Player(RED)

        game.curplayer = player1
        Just4Fun.place_stone!(spec, game, FieldValue(4))
        Just4Fun.place_stone!(spec, game, FieldValue(7))

        game.curplayer = player2
        Just4Fun.place_stone!(spec, game, FieldValue(4))
        Just4Fun.place_stone!(spec, game, FieldValue(7))

        @test Just4Fun.winner_by_numbers(spec, game) == (Player(0), end_by_draw)
    end

    @testset "player 1 has more" begin
        spec = Just4Fun.j4f_spec
        GI.spec(::Just4FunEnv) = spec
        game = GI.init(spec)
        player1 = Player(YELLOW)
        player2 = Player(RED)

        game.curplayer = player1
        Just4Fun.place_stone!(spec, game, FieldValue(4))
        Just4Fun.place_stone!(spec, game, FieldValue(5))

        game.curplayer = player2
        Just4Fun.place_stone!(spec, game, FieldValue(1))

        @test Just4Fun.winner_by_numbers(spec, game) == (player1, end_by_points)
    end


    @testset "player 2 has more" begin
        spec = Just4Fun.j4f_spec
        GI.spec(::Just4FunEnv) = spec
        game = GI.init(spec)
        player1 = Player(YELLOW)
        player2 = Player(RED)

        game.curplayer = player1
        Just4Fun.place_stone!(spec, game, FieldValue(4))

        game.curplayer = player2
        Just4Fun.place_stone!(spec, game, FieldValue(1))
        Just4Fun.place_stone!(spec, game, FieldValue(8))

        @test Just4Fun.winner_by_numbers(spec, game) == (player2, end_by_points)
    end

    @testset "same points but player 1 has highest field" begin
        spec = Just4Fun.j4f_spec
        GI.spec(::Just4FunEnv) = spec
        game = GI.init(spec)
        player1 = Player(YELLOW)
        player2 = Player(RED)

        game.curplayer = player1
        Just4Fun.place_stone!(spec, game, FieldValue(1))
        Just4Fun.place_stone!(spec, game, FieldValue(8))

        game.curplayer = player2
        Just4Fun.place_stone!(spec, game, FieldValue(4))
        Just4Fun.place_stone!(spec, game, FieldValue(5))

        @test Just4Fun.winner_by_numbers(spec, game) == (player1, end_by_max_field)
    end


    @testset "same points but player 2 has highest field" begin
        spec = Just4Fun.j4f_spec
        GI.spec(::Just4FunEnv) = spec
        game = GI.init(spec)
        player1 = Player(YELLOW)
        player2 = Player(RED)

        game.curplayer = player1
        Just4Fun.place_stone!(spec, game, FieldValue(7))
        Just4Fun.place_stone!(spec, game, FieldValue(2))

        game.curplayer = player2
        Just4Fun.place_stone!(spec, game, FieldValue(1))
        Just4Fun.place_stone!(spec, game, FieldValue(8))

        @test Just4Fun.winner_by_numbers(spec, game) == (player2, end_by_max_field)
    end
end
