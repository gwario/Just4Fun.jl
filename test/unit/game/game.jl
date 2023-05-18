@testset "Field value indexing default board settings" begin
    board_settings = Just4Fun.j4f_spec.settings.board
    # 1st row
    @test board_settings.value_distribution[1, 1] == 1
    @test board_settings.value_distribution[1, 2] == 14
    @test board_settings.value_distribution[1, 3] == 30
    @test board_settings.value_distribution[1, 4] == 24
    @test board_settings.value_distribution[1, 5] == 19
    @test board_settings.value_distribution[1, 6] == 8
    # 2nd row
    @test board_settings.value_distribution[2, 1] == 33
    @test board_settings.value_distribution[2, 2] == 11
    @test board_settings.value_distribution[2, 3] == 9
    @test board_settings.value_distribution[2, 4] == 16
    @test board_settings.value_distribution[2, 5] == 35
    @test board_settings.value_distribution[2, 6] == 21
    # 3rd row
    @test board_settings.value_distribution[3, 1] == 6
    @test board_settings.value_distribution[3, 2] == 27
    @test board_settings.value_distribution[3, 3] == 31
    @test board_settings.value_distribution[3, 4] == 20
    @test board_settings.value_distribution[3, 5] == 3
    @test board_settings.value_distribution[3, 6] == 12
    # 4th row
    @test board_settings.value_distribution[4, 1] == 15
    @test board_settings.value_distribution[4, 2] == 32
    @test board_settings.value_distribution[4, 3] == 5
    @test board_settings.value_distribution[4, 4] == 29
    @test board_settings.value_distribution[4, 5] == 17
    @test board_settings.value_distribution[4, 6] == 26
    # 5th row
    @test board_settings.value_distribution[5, 1] == 22
    @test board_settings.value_distribution[5, 2] == 10
    @test board_settings.value_distribution[5, 3] == 18
    @test board_settings.value_distribution[5, 4] == 36
    @test board_settings.value_distribution[5, 5] == 25
    @test board_settings.value_distribution[5, 6] == 2
    # 6th row
    @test board_settings.value_distribution[6, 1] == 28
    @test board_settings.value_distribution[6, 2] == 7
    @test board_settings.value_distribution[6, 3] == 23
    @test board_settings.value_distribution[6, 4] == 4
    @test board_settings.value_distribution[6, 5] == 13
    @test board_settings.value_distribution[6, 6] == 34
end

@testset "Field value indexing default mini j4f board settings" begin
    board_settings = Just4Fun.mini_j4f_spec.settings.board
    # 1st row
    @test board_settings.value_distribution[1, 1] == 5
    @test board_settings.value_distribution[1, 2] == 3
    @test board_settings.value_distribution[1, 3] == 6
    @test board_settings.value_distribution[1, 4] == 15
    # 2nd row
    @test board_settings.value_distribution[2, 1] == 11
    @test board_settings.value_distribution[2, 2] == 13
    @test board_settings.value_distribution[2, 3] == 9
    @test board_settings.value_distribution[2, 4] == 1
    # 3rd row
    @test board_settings.value_distribution[3, 1] == 14
    @test board_settings.value_distribution[3, 2] == 2
    @test board_settings.value_distribution[3, 3] == 12
    @test board_settings.value_distribution[3, 4] == 7
    # 4th row
    @test board_settings.value_distribution[4, 1] == 4
    @test board_settings.value_distribution[4, 2] == 8
    @test board_settings.value_distribution[4, 3] == 16
    @test board_settings.value_distribution[4, 4] == 10
end

@testset "Deck of cards default" begin
    deck_of_cards = Just4Fun.j4f_spec.settings.cards.deck
    @testset "deck of cards contains the cards from 1-12, four times each" begin
        @test count(isequal(1), deck_of_cards) == 4
        @test count(isequal(2), deck_of_cards) == 4
        @test count(isequal(3), deck_of_cards) == 4
        @test count(isequal(4), deck_of_cards) == 4
        @test count(isequal(5), deck_of_cards) == 4
        @test count(isequal(6), deck_of_cards) == 4
        @test count(isequal(7), deck_of_cards) == 4
        @test count(isequal(8), deck_of_cards) == 4
        @test count(isequal(9), deck_of_cards) == 4
        @test count(isequal(10), deck_of_cards) == 4
        @test count(isequal(11), deck_of_cards) == 4
        @test count(isequal(12), deck_of_cards) == 4
    end
    @testset "deck of cards contains the cards from 13-19 once each" begin
        @test count(isequal(13), deck_of_cards) == 1
        @test count(isequal(14), deck_of_cards) == 1
        @test count(isequal(15), deck_of_cards) == 1
        @test count(isequal(16), deck_of_cards) == 1
        @test count(isequal(17), deck_of_cards) == 1
        @test count(isequal(18), deck_of_cards) == 1
        @test count(isequal(19), deck_of_cards) == 1
    end
end

@testset "Deck of cards mini j4f" begin
    deck_of_cards = Just4Fun.mini_j4f_spec.settings.cards.deck
    @testset "deck of cards contains the cards from 1-12, four times each" begin
        @test count(isequal(1), deck_of_cards) == 4
        @test count(isequal(2), deck_of_cards) == 4
        @test count(isequal(3), deck_of_cards) == 4
        @test count(isequal(4), deck_of_cards) == 4
        @test count(isequal(5), deck_of_cards) == 4
    end
    @testset "deck of cards contains the cards from 13-19 once each" begin
        @test count(isequal(6), deck_of_cards) == 1
        @test count(isequal(7), deck_of_cards) == 1
        @test count(isequal(8), deck_of_cards) == 1
        @test count(isequal(9), deck_of_cards) == 1
    end
end

@testset "Game settings" begin
    @testset "Is two player game" begin
        spec = Just4Fun.j4f_spec
        GI.spec(::Just4FunEnv) = spec
        @test GI.two_players(spec) == true
    end
end

@testset "Game State" begin
    @testset "Get state returns set state game" begin
        expected_state = Just4FunEnvState((
            stack = Vector{CardValue}(),
            used_cards = Cards(),
            player_cards = SMatrix{4,2}([
                0x01 0x01
                0x02 0x02
                0x03 0x03
                0x04 0x04
            ]),
            field_stones = SArray{Tuple{6,6,2},Stones}(
                [
                    # p1
                    0x01 0x00 0x00 0x00 0x00 0x00; 0x00 0x01 0x00 0x00 0x00 0x00; 0x00 0x00 0x01 0x00 0x00 0x00; 0x00 0x00 0x00 0x01 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00;;;
                    # p2
                    0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00
                ],
            ),
            player_stones = SVector{2,Stones}(repeat([Stones(0)], 2)),
            curplayer = Player(Just4Fun.YELLOW),
            state = in_progress,
            winner = Player(0),
            actions = [],
        ))
        spec = Just4Fun.j4f_spec
        GI.spec(::Just4FunEnv) = spec
        game = GI.init(spec, expected_state)

        actual_state = GI.current_state(game)

        @test actual_state.stack == expected_state.stack
        @test actual_state.used_cards == expected_state.used_cards
        @test actual_state.player_cards == expected_state.player_cards
        @test actual_state.field_stones == expected_state.field_stones
        @test actual_state.player_stones == expected_state.player_stones
        @test actual_state.curplayer == expected_state.curplayer

    end
end

#####

@testset "Actions" begin
    @testset "Actions are 1-36" begin
        spec = Just4Fun.j4f_nc_spec
        GI.spec(::Just4FunEnv) = spec
        @test sort(GI.actions(spec)) == [
            FieldValue(1),
            FieldValue(2),
            FieldValue(3),
            FieldValue(4),
            FieldValue(5),
            FieldValue(6),
            FieldValue(7),
            FieldValue(8),
            FieldValue(9),
            FieldValue(10),
            FieldValue(11),
            FieldValue(12),
            FieldValue(13),
            FieldValue(14),
            FieldValue(15),
            FieldValue(16),
            FieldValue(17),
            FieldValue(18),
            FieldValue(19),
            FieldValue(20),
            FieldValue(21),
            FieldValue(22),
            FieldValue(23),
            FieldValue(24),
            FieldValue(25),
            FieldValue(26),
            FieldValue(27),
            FieldValue(28),
            FieldValue(29),
            FieldValue(30),
            FieldValue(31),
            FieldValue(32),
            FieldValue(33),
            FieldValue(34),
            FieldValue(35),
            FieldValue(36),
        ]
    end
end

@testset "Init, set state, reward and termination" begin

    GI.white_reward(g::Just4FunEnv) = Just4Fun.white_reward_ternary_outcome(g)

    @testset "four in a row (1,1 -> 4,1) for player yellow makes white reward 1 and game terminated true" begin

        state = Just4FunEnvState((
            stack = Vector{CardValue}(),
            used_cards = Just4Fun.Cards(),
            player_cards = SMatrix{4,2}([
                0x01 0x01
                0x02 0x02
                0x03 0x03
                0x04 0x04
            ]),
            field_stones = SArray{Tuple{6,6,2},Stones}(
                [
                    # p1
                    0x01 0x01 0x01 0x01 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00;;;
                    # p2
                    0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00
                ],
            ),
            player_stones = SVector{2,Stones}(repeat([Stones(0)], 2)),
            curplayer = Player(Just4Fun.YELLOW),
            state = in_progress,
            winner = Player(0),
            actions = [],
        ))
        spec = Just4Fun.j4f_spec
        GI.spec(::Just4FunEnv) = spec
        game = GI.init(spec, state)

        @test GI.white_reward(game) == 1.0
        @test GI.game_terminated(game) == true
    end

    @testset "four in a row (1,1 -> 1,4) for player yellow makes white reward 1 and game terminated true" begin

        state = Just4FunEnvState((
            stack = Vector{CardValue}(),
            used_cards = Just4Fun.Cards(),
            player_cards = SMatrix{4,2}([
                0x01 0x01
                0x02 0x02
                0x03 0x03
                0x04 0x04
            ]),
            field_stones = SArray{Tuple{6,6,2},Stones}(
                [
                    # p1
                    0x01 0x00 0x00 0x00 0x00 0x00; 0x01 0x00 0x00 0x00 0x00 0x00; 0x01 0x00 0x00 0x00 0x00 0x00; 0x01 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00;;;
                    # p2
                    0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00
                ],
            ),
            player_stones = SVector{2,Stones}(repeat([Stones(0)], 2)),
            curplayer = Player(Just4Fun.YELLOW),
            state = in_progress,
            winner = Player(0),
            actions = [],
        ))
        spec = Just4Fun.j4f_spec
        GI.spec(::Just4FunEnv) = spec
        game = GI.init(spec, state)

        @test GI.white_reward(game) == 1.0
        @test GI.game_terminated(game) == true
    end

    @testset "four in a row (1,6 -> 4,2 diagonal) for player yellow makes white reward 1 and game terminated true" begin

        state = Just4FunEnvState((
            stack = Vector{CardValue}(),
            used_cards = Cards(),
            player_cards = SMatrix{4,2}([
                0x01 0x01
                0x02 0x02
                0x03 0x03
                0x04 0x04
            ]),
            field_stones = SArray{Tuple{6,6,2},Stones}(
                [
                    # p1
                    0x00 0x00 0x00 0x00 0x00 0x01; 0x00 0x00 0x00 0x00 0x01 0x00; 0x00 0x00 0x00 0x01 0x00 0x00; 0x00 0x00 0x01 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00;;;
                    # p2
                    0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00
                ],
            ),
            player_stones = SVector{2,Stones}(repeat([Stones(0)], 2)),
            curplayer = Player(RED),
            state = in_progress,
            winner = Player(0),
            actions = [],
        ))
        spec = Just4Fun.j4f_spec
        GI.spec(::Just4FunEnv) = spec
        game = GI.init(spec, state)

        @test GI.white_reward(game) == 1.0
        @test GI.game_terminated(game) == true
    end

    #####

    @testset "four in a row (1,1 -> 4,1) for player red makes white reward -1 and game terminated true" begin

        state = Just4FunEnvState((
            stack = Vector{CardValue}(),
            used_cards = Cards(),
            player_cards = SMatrix{4,2}([
                0x01 0x01
                0x02 0x02
                0x03 0x03
                0x04 0x04
            ]),
            field_stones = SArray{Tuple{6,6,2},Stones}(
                [
                    # p1
                    0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x01 0x00 0x00 0x00 0x00; 0x01 0x00 0x00 0x00 0x00 0x00; 0x00 0x01 0x00 0x00 0x00 0x00; 0x00 0x00 0x01 0x00 0x00 0x00;;;
                    # p2
                    0x01 0x01 0x01 0x01 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00
                ],
            ),
            player_stones = SVector{2,Stones}(repeat([Stones(0)], 2)),
            curplayer = Player(RED),
            state = in_progress,
            winner = Player(0),
            actions = [],
        ))
        spec = Just4Fun.j4f_spec
        GI.spec(::Just4FunEnv) = spec
        game = GI.init(spec, state)

        @test GI.white_reward(game) == -1.0
        @test GI.game_terminated(game) == true
    end

    @testset "four in a row (1,1 -> 1,4) for player red makes white reward -1 and game terminated true" begin

        state = Just4FunEnvState((
            stack = Vector{CardValue}(),
            used_cards = Cards(),
            player_cards = SMatrix{4,2}([
                0x01 0x01
                0x02 0x02
                0x03 0x03
                0x04 0x04
            ]),
            field_stones = SArray{Tuple{6,6,2},Stones}(
                [
                    # p1
                    0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00;;;
                    # p2
                    0x01 0x00 0x00 0x00 0x00 0x00; 0x01 0x00 0x00 0x00 0x00 0x00; 0x01 0x00 0x00 0x00 0x00 0x00; 0x01 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00
                ],
            ),
            player_stones = SVector{2,Stones}(repeat([Stones(0)], 2)),
            curplayer = Player(RED),
            state = in_progress,
            winner = Player(0),
            actions = [],
        ))
        spec = Just4Fun.j4f_spec
        GI.spec(::Just4FunEnv) = spec
        game = GI.init(spec, state)

        @test GI.white_reward(game) == -1.0
        @test GI.game_terminated(game) == true
    end

    @testset "four in a row (1,1 -> 4,4 diagonal) for player red makes white reward -1 and game terminated true" begin

        state = Just4FunEnvState((
            stack = Vector{CardValue}(),
            used_cards = Cards(),
            player_cards = SMatrix{4,2}([
                0x01 0x01
                0x02 0x02
                0x03 0x03
                0x04 0x04
            ]),
            field_stones = SArray{Tuple{6,6,2},Stones}(
                [
                    # p1
                    0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00;;;
                    # p2
                    0x01 0x00 0x00 0x00 0x00 0x00; 0x00 0x01 0x00 0x00 0x00 0x00; 0x00 0x00 0x01 0x00 0x00 0x00; 0x00 0x00 0x00 0x01 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00
                ],
            ),
            player_stones = SVector{2,Stones}(repeat([Stones(0)], 2)),
            curplayer = Player(RED),
            state = in_progress,
            winner = Player(0),
            actions = [],
        ))
        spec = Just4Fun.j4f_spec
        GI.spec(::Just4FunEnv) = spec
        game = GI.init(spec, state)

        @test GI.white_reward(game) == -1.0
        @test GI.game_terminated(game) == true
    end

    #####

    @testset "neither player has won nor are out of stones makes white reward 0 and game terminated false" begin
        stack = Vector{CardValue}()
        push!(stack, 0x1)
        push!(stack, 0x2)
        push!(stack, 0x3)
        push!(stack, 0x4)
        state = Just4FunEnvState((
            stack = stack,
            used_cards = Cards(),
            player_cards = SMatrix{4,2}([
                0x01 0x01
                0x02 0x02
                0x03 0x03
                0x04 0x04
            ]),
            field_stones = SArray{Tuple{6,6,2},Stones}(
                [
                    # p1
                    0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00;;;
                    # p2
                    0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00
                ],
            ),
            player_stones = SVector{2,Stones}(repeat([Stones(4)], 2)),
            curplayer = Player(Just4Fun.YELLOW),
            state = in_progress,
            winner = Player(0),
            actions = [],
        ))
        spec = Just4Fun.j4f_spec
        GI.spec(::Just4FunEnv) = spec
        game = GI.init(spec, state)

        @test GI.white_reward(game) == 0
        @test GI.game_terminated(game) == false
    end

    #####

    @testset "if curplayer is yellow, white playing is true" begin

        stack = Vector{CardValue}()
        push!(stack, 0x1)
        push!(stack, 0x2)
        push!(stack, 0x3)
        push!(stack, 0x4)
        state = Just4FunEnvState((
            stack = stack,
            used_cards = Cards(),
            player_cards = SMatrix{4,2}([
                0x01 0x01
                0x02 0x02
                0x03 0x03
                0x04 0x04
            ]),
            field_stones = SArray{Tuple{6,6,2},Stones}(
                [
                    # p1
                    0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00;;;
                    # p2
                    0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00
                ],
            ),
            player_stones = SVector{2,Stones}(repeat([Stones(4)], 2)),
            curplayer = Player(Just4Fun.YELLOW),
            state = in_progress,
            winner = Player(0),
            actions = [],
        ))
        spec = Just4Fun.j4f_spec
        GI.spec(::Just4FunEnv) = spec
        game = GI.init(spec, state)

        @test GI.white_playing(game) == true
    end

    @testset "if curplayer is red, white playing is false" begin

        stack = Vector{CardValue}()
        push!(stack, 0x1)
        push!(stack, 0x2)
        push!(stack, 0x3)
        push!(stack, 0x4)
        state = Just4FunEnvState((
            stack = stack,
            used_cards = Cards(),
            player_cards = SMatrix{4,2}([
                0x01 0x01
                0x02 0x02
                0x03 0x03
                0x04 0x04
            ]),
            field_stones = SArray{Tuple{6,6,2},Stones}(
                [
                    # p1
                    0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00;;;
                    # p2
                    0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00
                ],
            ),
            player_stones = SVector{2,Stones}(repeat([Stones(4)], 2)),
            curplayer = Player(Just4Fun.RED),
            state = in_progress,
            winner = Player(0),
            actions = [],
        ))
        spec = Just4Fun.j4f_spec
        GI.spec(::Just4FunEnv) = spec
        game = GI.init(spec, state)

        @test GI.white_playing(game) == false
    end

    #########

    # there can be no draw
    @testset "player with highest pos wins (yellow)" begin

        stack = Vector{CardValue}()
        state = Just4FunEnvState((
            stack = stack,
            used_cards = Cards(),
            player_cards = SMatrix{4,2}([
                0x01 0x01
                0x02 0x02
                0x03 0x03
                0x04 0x04
            ]),
            field_stones = SArray{Tuple{6,6,2},Stones}(
                [
                    # p1
                    0x00 0x00 0x01 0x00 0x00 0x00; # __ __ 30 __ __ __
                    0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00;;;
                    # p2
                    0x01 0x01 0x00 0x00 0x00 0x00; # _1 14 __ __ __ __
                    0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00
                ],
            ),
            player_stones = SVector{2,Stones}(repeat([Stones(0)], 2)),
            curplayer = Player(Just4Fun.YELLOW),
            state = in_progress,
            winner = Player(0),
            actions = [],
        ))
        spec = Just4Fun.j4f_spec
        GI.spec(::Just4FunEnv) = spec
        game = GI.init(spec)
        GI.set_state!(game, state)

        @test GI.white_reward(game) == 1.0
        @test GI.game_terminated(game) == true
    end

    @testset "player with highest pos wins (yellow)" begin

        stack = Vector{CardValue}()
        state = Just4FunEnvState((
            stack = stack,
            used_cards = Cards(),
            player_cards = SMatrix{4,2}([
                0x01 0x01
                0x02 0x02
                0x03 0x03
                0x04 0x04
            ]),
            field_stones = SArray{Tuple{6,6,2},Stones}(
                [
                    # p1
                    0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x01 0x00 0x00 0x00 0x00 0x00; # 15 __ __ __ __ __
                    0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00;;;
                    # p2
                    0x01 0x01 0x00 0x00 0x00 0x00; # _1 14 __ __ __ __
                    0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00
                ],
            ),
            player_stones = SVector{2,Stones}(repeat([Stones(0)], 2)),
            curplayer = Player(Just4Fun.YELLOW),
            state = in_progress,
            winner = Player(0),
            actions = [],
        ))
        spec = Just4Fun.j4f_spec
        GI.spec(::Just4FunEnv) = spec
        game = GI.init(spec)
        GI.set_state!(game, state)

        @test GI.white_reward(game) == -1.0
        @test GI.game_terminated(game) == true
    end

    #####

    @testset "player with most points wins (red)" begin

        stack = Vector{CardValue}()
        state = Just4FunEnvState((
            stack = stack,
            used_cards = Cards(),
            player_cards = SMatrix{4,2}([
                0x01 0x01
                0x02 0x02
                0x03 0x03
                0x04 0x04
            ]),
            field_stones = SArray{Tuple{6,6,2},Stones}(
                [
                    # p1
                    0x00 0x00 0x00 0x01 0x00 0x00; # __ __ __ 24 __ __
                    0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00;;;
                    # p2
                    0x01 0x01 0x01 0x00 0x00 0x00; # _1 14 30 __ __ __
                    0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00
                ],
            ),
            player_stones = SVector{2,Stones}(repeat([Stones(0)], 2)),
            curplayer = Player(Just4Fun.YELLOW),
            state = in_progress,
            winner = Player(0),
            actions = [],
        ))
        spec = Just4Fun.j4f_spec
        GI.spec(::Just4FunEnv) = spec
        game = GI.init(spec)
        GI.set_state!(game, state)

        @test GI.white_reward(game) == -1.0
        @test GI.game_terminated(game) == true
    end

    @testset "player with most points wins (yellow)" begin

        stack = Vector{CardValue}()
        state = Just4FunEnvState((
            stack = stack,
            used_cards = Cards(),
            player_cards = SMatrix{4,2}([
                0x01 0x01
                0x02 0x02
                0x03 0x03
                0x04 0x04
            ]),
            field_stones = SArray{Tuple{6,6,2},Stones}(
                [
                    # p1
                    0x01 0x01 0x01 0x00 0x00 0x00; # _1 14 30 __ __ __
                    0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00;;;
                    # p2
                    0x00 0x00 0x00 0x01 0x00 0x00; # __ __ __ 24 __ __
                    0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00
                ],
            ),
            player_stones = SVector{2,Stones}(repeat([Stones(0)], 2)),
            curplayer = Player(Just4Fun.YELLOW),
            state = in_progress,
            winner = Player(0),
            actions = [],
        ))
        spec = Just4Fun.j4f_spec
        GI.spec(::Just4FunEnv) = spec
        game = GI.init(spec)
        GI.set_state!(game, state)

        @test GI.white_reward(game) == 1.0
        @test GI.game_terminated(game) == true
    end
end