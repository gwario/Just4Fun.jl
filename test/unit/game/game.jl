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
            action_indices = [],
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
    @testset "there are no card combinations with a sum of more than 36" begin
        spec = Just4Fun.j4f_spec
        GI.spec(::Just4FunEnv) = spec
        @test findall(a -> a.value > FieldValue(36), GI.actions(spec)) == []
    end

    @testset "there are no card combinations with a sum of less than 0" begin
        spec = Just4Fun.j4f_spec
        GI.spec(::Just4FunEnv) = spec
        @test findall(a -> a.value < FieldValue(0), GI.actions(spec)) == []
    end

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
            action_indices = [],
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
            action_indices = [],
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
            action_indices = [],
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
                    0x00 0x00 0x00 0x00 0x00 0x00;
                    0x00 0x00 0x00 0x00 0x00 0x00; 
                    0x00 0x01 0x00 0x00 0x00 0x00; 
                    0x01 0x00 0x00 0x00 0x00 0x00; 
                    0x00 0x01 0x00 0x00 0x00 0x00; 
                    0x00 0x00 0x01 0x00 0x00 0x00;;;
                    # p2
                    0x01 0x01 0x01 0x01 0x00 0x00; 
                    0x00 0x00 0x00 0x00 0x00 0x00; 
                    0x00 0x00 0x00 0x00 0x00 0x00; 
                    0x00 0x00 0x00 0x00 0x00 0x00; 
                    0x00 0x00 0x00 0x00 0x00 0x00; 
                    0x00 0x00 0x00 0x00 0x00 0x00
                ],
            ),
            player_stones = SVector{2,Stones}(repeat([Stones(0)], 2)),
            curplayer = Player(RED),
            state = in_progress,
            winner = Player(0),
            action_indices = [],
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
            action_indices = [],
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
            action_indices = [],
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
            action_indices = [],
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
            action_indices = [],
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
            action_indices = [],
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
            action_indices = [],
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
            action_indices = [],
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
            action_indices = [],
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
            action_indices = [],
        ))
        spec = Just4Fun.j4f_spec
        GI.spec(::Just4FunEnv) = spec
        game = GI.init(spec)
        GI.set_state!(game, state)

        @test GI.white_reward(game) == 1.0
        @test GI.game_terminated(game) == true
    end
end

@testset "available_net_actions_indices(::Just4FunSpec, ::Just4FunEnv)::Vector{Int64} J4F" begin

  #default field value distribution column-wise as array
  # 01 14 30 24 19  8 ;
  # 33 11  9 16 35 21 ;
  # 06 27 31 20  3 12 ;
  # 15 32  5 29 17 26 ;
  # 22 10 18 36 25  2 ;
  # 28  7 23  4 13 34
  # action board indices:
  # action order: .....
  spec = Just4Fun.j4f_spec
  GI.spec(::Just4FunEnv) = spec
  env = GI.init(spec)
  env.curplayer = Player(YELLOW)
  # 1  2 3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36
  # 1,33,6,15,22,28,14,11,27,32,10,7, 30, 9,31, 5,18,23,24,16,20,29,36, 4,19,35, 3,17,25,13, 8,21,12,26, 2,34
  @show vec(spec.settings.board.value_distribution)
  env.player_cards =
    SMatrix{spec.settings.cards.size_hand,spec.settings.players,CardValue}([
      CardValue(1) CardValue(3) ;
      CardValue(1) CardValue(3) ;
      CardValue(1) CardValue(3) ;
      CardValue(1) CardValue(3)
    ])
  Just4Fun.update_action_mask!(spec, env)
  @test map(Just4Fun.to_int_field_value, GI.available_actions(env)) == [
    1, 2, 3, 4
  ]
  @test Just4Fun.available_net_actions_indices(spec, env) == [1, 35, 27, 24]
  @test vec(spec.settings.board.value_distribution)[[1, 35, 27, 24]] ==
        map(Just4Fun.to_int_field_value, GI.available_actions(env))

  env.player_cards =
    SMatrix{spec.settings.cards.size_hand,spec.settings.players,CardValue}([
      CardValue(1) CardValue(3) ;
      CardValue(2) CardValue(3) ;
      CardValue(3) CardValue(3) ;
      CardValue(4) CardValue(3)
    ])
  Just4Fun.update_action_mask!(spec, env)

  # check all actions according to cards possible
  @show map(Just4Fun.to_int_cards, GI.available_actions(env))
  @test Just4Fun.available_net_actions_indices(spec, env) == [
  # [[1], [2], [3], [1, 2], [4], [1, 3], [1, 4], [2, 3], [2, 4], [1, 2, 3],  
    1,    35,  27,      27,   24,     24,     16,     16,      3,         3,
  # [3, 4], [1, 2, 4], [1, 3, 4], [2, 3, 4], [1, 2, 3, 4]]
    12,            12,       31,        14,           11
  ]
  @test vec(spec.settings.board.value_distribution)[[1, 35, 27, 27, 24, 24, 16, 16, 3, 3,12, 12, 31, 14, 11]] ==
        map(Just4Fun.to_int_field_value, GI.available_actions(env))
  # compressed consistency check
  @test vec(spec.settings.board.value_distribution)[
    Just4Fun.available_net_actions_indices(spec, env)
  ] == map(Just4Fun.to_int_field_value, GI.available_actions(env))

  # block some fields
  Just4Fun.place_stone!(spec, env, FieldValue(1))
  Just4Fun.place_stone!(spec, env, FieldValue(1))

  Just4Fun.place_stone!(spec, env, FieldValue(2))
  Just4Fun.place_stone!(spec, env, FieldValue(2))
  Just4Fun.update_action_mask!(spec, env)
  
  # check actions 1 and 2 not available anymore
  @show map(Just4Fun.to_int_cards, GI.available_actions(env))
  @test Just4Fun.available_net_actions_indices(spec, env) == [
  # [[3], [1, 2], [4], [1, 3], [1, 4], [2, 3], [2, 4], [1, 2, 3],  
    27,       27,  24,     24,     16,     16,      3,         3,
  # [3, 4], [1, 2, 4], [1, 3, 4], [2, 3, 4], [1, 2, 3, 4]]
    12,            12,       31,        14,           11
  ]
  @test vec(spec.settings.board.value_distribution)[
    [27, 27, 24, 24, 16, 16, 3, 3, 12, 12, 31, 14, 11]
  ] == map(Just4Fun.to_int_field_value, GI.available_actions(env))
  # compressed consistency check
  @test vec(spec.settings.board.value_distribution)[
    Just4Fun.available_net_actions_indices(spec, env)
  ] == map(Just4Fun.to_int_field_value, GI.available_actions(env))
end

@testset "available_net_actions_indices(::Just4FunSpec, ::Just4FunEnv)::Vector{Int64} J4F NC" begin

  #default field value distribution column-wise as array
  # 01 14 30 24 19  8 ;
  # 33 11  9 16 35 21 ;
  # 06 27 31 20  3 12 ;
  # 15 32  5 29 17 26 ;
  # 22 10 18 36 25  2 ;
  # 28  7 23  4 13 34
  # action board indices:
  # 1  2 3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36
  # 1,33,6,15,22,28,14,11,27,32,10,7, 30, 9,31, 5,18,23,24,16,20,29,36, 4,19,35, 3,17,25,13, 8,21,12,26, 2,34
  # action order: 1...36

  spec = Just4Fun.j4f_nc_spec
  GI.spec(::Just4FunEnv) = spec
  env = GI.init(spec)
  env.curplayer = Player(YELLOW)
  @test map(Just4Fun.to_int_field_value, GI.available_actions(env)) == [
    1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
    21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36
  ]
  
  # check all actions according to cards possible
  @test Just4Fun.available_net_actions_indices(spec, env) == [
      1, 35,27,24,16,3,12,31,14,11,8,33,30,7,4,20,28,17,25,21,32,5,18,19,29,34,9,6,22,
      13,15,10,2,36,26,23,
  ]
  @test vec(spec.settings.board.value_distribution)[[
      1,35,27,24,16,3,12,31,14,11,8,33,30,
      7, 4,20,28,17,25,21,32,5,18,19,
      29,34,9,6,22,13,15,10,2,36,26,23,
  ]] == map(Just4Fun.to_int_field_value, GI.available_actions(env))
  # compressed consistency check
  @test vec(spec.settings.board.value_distribution)[
    Just4Fun.available_net_actions_indices(spec, env)
  ] == map(Just4Fun.to_int_field_value, GI.available_actions(env))
  
  # block some fields
  Just4Fun.place_stone!(spec, env, FieldValue(1))
  Just4Fun.place_stone!(spec, env, FieldValue(1))

  Just4Fun.place_stone!(spec, env, FieldValue(2))
  Just4Fun.place_stone!(spec, env, FieldValue(2))
  Just4Fun.update_action_mask!(spec, env)
  
  # check actions 1 and 2 not available anymore
  @test map(Just4Fun.to_int_field_value, GI.available_actions(env)) == [
    3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
    21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36
  ]
  @test Just4Fun.available_net_actions_indices(spec, env) == [
      27,24,16,3,12,31,14,11,8,33,30,7,4,20,28,17,25,21,32,5,18,19,29,34,9,6,22,
      13,15,10,2,36,26,23,
  ]
  @test vec(spec.settings.board.value_distribution)[[
      27,24,16,3,12,31,14,11,8,33,30,
      7, 4,20,28,17,25,21,32,5,18,19,
      29,34,9,6,22,13,15,10,2,36,26,23,
  ]] == map(Just4Fun.to_int_field_value, GI.available_actions(env))
  # compressed consistency check
  @test vec(spec.settings.board.value_distribution)[
    Just4Fun.available_net_actions_indices(spec, env)
  ] == map(Just4Fun.to_int_field_value, GI.available_actions(env))
end

@testset "available_net_actions_indices(::Just4FunSpec, ::Just4FunEnv)::Vector{Int64} MINI J4F" begin

  #default field value distribution column-wise as array
  # mini j4f
  # 05  3  6 15 ;
  # 11 13  9  1 ;
  # 14  2 12  7 ;
  # 04  8 16 10
  # action board indices:
  # 1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16
  # 5,11,14, 4, 3,13, 2, 8, 6, 9,12,16,15, 1, 7,10
  # action order: 1...16
  spec = Just4Fun.mini_j4f_spec
  GI.spec(::Just4FunEnv) = spec
  env = GI.init(spec)
  env.curplayer = Player(YELLOW)
  env.player_cards =
    SMatrix{spec.settings.cards.size_hand,spec.settings.players,CardValue}([
      CardValue(1) CardValue(3) ;
      CardValue(1) CardValue(3) ;
      CardValue(1) CardValue(3) ;
      CardValue(1) CardValue(3)
    ])
  Just4Fun.update_action_mask!(spec, env)
  @show map(Just4Fun.to_int_cards, GI.available_actions(env))
  # [[1], [1, 1], [1, 1, 1], [1, 1, 1, 1]]
  @test map(Just4Fun.to_int_field_value, GI.available_actions(env)) == [
    1, 2, 3, 4
  ]
  @test Just4Fun.available_net_actions_indices(spec, env) == [14, 7, 5, 4]
  @test vec(spec.settings.board.value_distribution)[[14, 7, 5, 4]] ==
        map(Just4Fun.to_int_field_value, GI.available_actions(env))

  env.player_cards =
    SMatrix{spec.settings.cards.size_hand,spec.settings.players,CardValue}([
      CardValue(1) CardValue(3) ;
      CardValue(2) CardValue(3) ;
      CardValue(3) CardValue(3) ;
      CardValue(4) CardValue(3)
    ])
  Just4Fun.update_action_mask!(spec, env)
  # check all actions according to cards possible
  @show map(Just4Fun.to_int_cards, GI.available_actions(env))
  # [[1], [2], [3], [1, 2], [4], [1, 3], [1, 4], [2, 3], [2, 4], [1, 2, 3], [3, 4], [1, 2, 4], [1, 3, 4], [2, 3, 4], [1, 2, 3, 4]]
  @test map(Just4Fun.to_int_field_value, GI.available_actions(env)) == [
    1, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 9, 10
  ]
  @test Just4Fun.available_net_actions_indices(spec, env) == [14, 7, 5, 5, 4, 4, 1, 1, 9, 9, 15, 15, 8, 10, 16]
  @test vec(spec.settings.board.value_distribution)[[
    14, 7, 5, 5, 4, 4, 1, 1, 9, 9, 15, 15, 8, 10, 16
  ]] == map(Just4Fun.to_int_field_value, GI.available_actions(env))
  # compressed consistency check
  @test vec(spec.settings.board.value_distribution)[
    Just4Fun.available_net_actions_indices(spec, env)
  ] == map(Just4Fun.to_int_field_value, GI.available_actions(env))

  # block some fields
  Just4Fun.place_stone!(spec, env, FieldValue(1))
  Just4Fun.place_stone!(spec, env, FieldValue(1))

  Just4Fun.place_stone!(spec, env, FieldValue(2))
  Just4Fun.place_stone!(spec, env, FieldValue(2))
  Just4Fun.update_action_mask!(spec, env)
  
  # check actions 1 and 2 not available anymore
  @show map(Just4Fun.to_int_cards, GI.available_actions(env))
  # [[3], [1, 2], [4], [1, 3], [1, 4], [2, 3], [2, 4], [1, 2, 3], [3, 4], [1, 2, 4], [1, 3, 4], [2, 3, 4], [1, 2, 3, 4]]
  @test map(Just4Fun.to_int_field_value, GI.available_actions(env)) == [
    3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 9, 10
  ]
  @test Just4Fun.available_net_actions_indices(spec, env) == [5, 5, 4, 4, 1, 1, 9, 9, 15, 15, 8, 10, 16]
  @test vec(spec.settings.board.value_distribution)[[
    5, 5, 4, 4, 1, 1, 9, 9, 15, 15, 8, 10, 16
  ]] == map(Just4Fun.to_int_field_value, GI.available_actions(env))
  # compressed consistency check
  @test vec(spec.settings.board.value_distribution)[
    Just4Fun.available_net_actions_indices(spec, env)
  ] == map(Just4Fun.to_int_field_value, GI.available_actions(env))
end

@testset "available_net_actions_indices(::Just4FunSpec, ::Just4FunEnv)::Vector{Int64} MINI J4F NC" begin

  #default field value distribution column-wise as array
  # mini j4f
  #  5   11   14    4
  #  3   13    2    8
  #  6    9   12   16
  # 15    1    7   10
  # action board indices:
  # 1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16
  # 5,11,14, 4, 3,13, 2, 8, 6, 9,12,16,15, 1, 7,10
  # action order: 1...16
  spec = Just4Fun.mini_j4f_nc_spec
  GI.spec(::Just4FunEnv) = spec
  env = GI.init(spec)
  env.curplayer = Player(YELLOW)
  @show map(Just4Fun.to_int_field_value, GI.available_actions(env))
  @test map(Just4Fun.to_int_field_value, GI.available_actions(env)) == [
    1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
  ]
  @test Just4Fun.available_net_actions_indices(spec, env) ==
    [14, 7, 5, 4, 1, 9, 15, 8, 10, 16, 2, 11, 6, 3, 13, 12]
  @test vec(spec.settings.board.value_distribution)[[
    14, 7, 5, 4, 1, 9, 15, 8, 10, 16, 2, 11, 6, 3, 13, 12,
  ]] == map(Just4Fun.to_int_field_value, GI.available_actions(env))
  
  # block some fields
  Just4Fun.place_stone!(spec, env, FieldValue(1))
  Just4Fun.place_stone!(spec, env, FieldValue(1))
  Just4Fun.place_stone!(spec, env, FieldValue(2))
  Just4Fun.update_action_mask!(spec, env)
  env.curplayer = Player(RED)

  # only 1 is blocked
  @test Just4Fun.available_net_actions_indices(spec, env) ==
    [7, 5, 4, 1, 9, 15, 8, 10, 16, 2, 11, 6, 3, 13, 12]
  @test vec(spec.settings.board.value_distribution)[[
    7, 5, 4, 1, 9, 15, 8, 10, 16, 2, 11, 6, 3, 13, 12,
  ]] == map(Just4Fun.to_int_field_value, GI.available_actions(env))
end

@testset "available_net_actions_indices(::Just4FunSpec, ::Just4FunEnv)::Vector{Int64} MINI J4F NC NF" begin

  #default field value distribution column-wise as array
  # mini j4f
  #  5   11   14    4
  #  3   13    2    8
  #  6    9   12   16
  # 15    1    7   10
  # action board indices:
  # 1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16
  # 5,11,14, 4, 3,13, 2, 8, 6, 9,12,16,15, 1, 7,10
  # action order: 1...16
  spec = Just4Fun.mini_j4f_nc_nf_spec
  GI.spec(::Just4FunEnv) = spec
  env = GI.init(spec)
  env.curplayer = Player(YELLOW)
  @show map(Just4Fun.to_int_field_value, GI.available_actions(env))
  @test map(Just4Fun.to_int_field_value, GI.available_actions(env)) == [
    1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
  ]
  @test Just4Fun.available_net_actions_indices(spec, env) ==
    [14, 7, 5, 4, 1, 9, 15, 8, 10, 16, 2, 11, 6, 3, 13, 12]
  @test vec(spec.settings.board.value_distribution)[[
    14, 7, 5, 4, 1, 9, 15, 8, 10, 16, 2, 11, 6, 3, 13, 12,
  ]] == map(Just4Fun.to_int_field_value, GI.available_actions(env))

  # block some fields
  Just4Fun.place_stone!(spec, env, FieldValue(1))
  Just4Fun.place_stone!(spec, env, FieldValue(2))
  Just4Fun.place_stone!(spec, env, FieldValue(3))
  Just4Fun.place_stone!(spec, env, FieldValue(3))
  Just4Fun.update_action_mask!(spec, env)
  env.curplayer = Player(RED)

  # only 3 is blocked
  @test Just4Fun.available_net_actions_indices(spec, env) ==
    [14, 7, 4, 1, 9, 15, 8, 10, 16, 2, 11, 6, 3, 13, 12]
  @test vec(spec.settings.board.value_distribution)[[
    14, 7, 4, 1, 9, 15, 8, 10, 16, 2, 11, 6, 3, 13, 12,
  ]] == map(Just4Fun.to_int_field_value, GI.available_actions(env))
end

@testset "available_net_actions_indices(::Just4FunSpec, ::Just4FunEnv)::Vector{Int64} MINI J4F NC NF NM" begin

  #default field value distribution column-wise as array
  # mini j4f
  #  5   11   14    4
  #  3   13    2    8
  #  6    9   12   16
  # 15    1    7   10
  # action board indices:
  # 1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16
  # 5,11,14, 4, 3,13, 2, 8, 6, 9,12,16,15, 1, 7,10
  # action order: 1...16
  spec = Just4Fun.mini_j4f_nc_nf_nm_spec
  GI.spec(::Just4FunEnv) = spec
  env = GI.init(spec)
  env.curplayer = Player(YELLOW)
  @show map(Just4Fun.to_int_field_value, GI.available_actions(env))
  @test map(Just4Fun.to_int_field_value, GI.available_actions(env)) == [
    1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
  ]
  @test Just4Fun.available_net_actions_indices(spec, env) ==
    [14, 7, 5, 4, 1, 9, 15, 8, 10, 16, 2, 11, 6, 3, 13, 12]
  @test vec(spec.settings.board.value_distribution)[[
    14, 7, 5, 4, 1, 9, 15, 8, 10, 16, 2, 11, 6, 3, 13, 12,
  ]] == map(Just4Fun.to_int_field_value, GI.available_actions(env))

  # block some fields
  Just4Fun.place_stone!(spec, env, FieldValue(1))
  Just4Fun.place_stone!(spec, env, FieldValue(2))
  Just4Fun.place_stone!(spec, env, FieldValue(3))
  Just4Fun.update_action_mask!(spec, env)
  env.curplayer = Player(RED)

  # only 3 an also 1 and 2 is blocked
  @test Just4Fun.available_net_actions_indices(spec, env) ==
    [4, 1, 9, 15, 8, 10, 16, 2, 11, 6, 3, 13, 12]
  @test vec(spec.settings.board.value_distribution)[[
    4, 1, 9, 15, 8, 10, 16, 2, 11, 6, 3, 13, 12,
  ]] == map(Just4Fun.to_int_field_value, GI.available_actions(env))
end
