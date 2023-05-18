@testset "player_fieldstones" begin

    @testset "1" begin
        state::Just4FunEnvState = (
            stack = Vector{CardValue}(),
            used_cards = Cards(),
            player_cards = Matrix{CardValue}([
                0x01 0x01
                0x02 0x02
                0x03 0x03
                0x04 0x04
            ]),
            field_stones = Array{Stones}(
                [
                    # p1
                    0x02 0x00 0x00 0x01; 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00;;;
                    # p2
                    0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00; 0x01 0x00 0x00 0x02
                ],
            ),
            player_stones = Vector{Stones}(repeat([Stones(20)], 2)),
            curplayer = Player(Just4Fun.YELLOW),
            state = in_progress,
            winner = Player(0),
            actions = [1],
        )

        @test Just4Fun.player_fieldstones(state, 1, 1, Player(1)) == Stones(2)
        @test Just4Fun.player_fieldstones(state, 2, 1, Player(1)) == Stones(0)
        @test Just4Fun.player_fieldstones(state, 3, 1, Player(1)) == Stones(0)
        @test Just4Fun.player_fieldstones(state, 4, 1, Player(1)) == Stones(1)
        @test Just4Fun.player_fieldstones(state, 1, 2, Player(1)) == Stones(0)
        @test Just4Fun.player_fieldstones(state, 2, 2, Player(1)) == Stones(0)
        @test Just4Fun.player_fieldstones(state, 3, 2, Player(1)) == Stones(0)
        @test Just4Fun.player_fieldstones(state, 4, 2, Player(1)) == Stones(0)
        @test Just4Fun.player_fieldstones(state, 1, 3, Player(1)) == Stones(0)
        @test Just4Fun.player_fieldstones(state, 2, 3, Player(1)) == Stones(0)
        @test Just4Fun.player_fieldstones(state, 3, 3, Player(1)) == Stones(0)
        @test Just4Fun.player_fieldstones(state, 4, 3, Player(1)) == Stones(0)
        @test Just4Fun.player_fieldstones(state, 1, 4, Player(1)) == Stones(0)
        @test Just4Fun.player_fieldstones(state, 2, 4, Player(1)) == Stones(0)
        @test Just4Fun.player_fieldstones(state, 3, 4, Player(1)) == Stones(0)
        @test Just4Fun.player_fieldstones(state, 4, 4, Player(1)) == Stones(0)

        @test Just4Fun.player_fieldstones(state, 1, 1, Player(2)) == Stones(0)
        @test Just4Fun.player_fieldstones(state, 2, 1, Player(2)) == Stones(0)
        @test Just4Fun.player_fieldstones(state, 3, 1, Player(2)) == Stones(0)
        @test Just4Fun.player_fieldstones(state, 4, 1, Player(2)) == Stones(0)
        @test Just4Fun.player_fieldstones(state, 1, 2, Player(2)) == Stones(0)
        @test Just4Fun.player_fieldstones(state, 2, 2, Player(2)) == Stones(0)
        @test Just4Fun.player_fieldstones(state, 3, 2, Player(2)) == Stones(0)
        @test Just4Fun.player_fieldstones(state, 4, 2, Player(2)) == Stones(0)
        @test Just4Fun.player_fieldstones(state, 1, 3, Player(2)) == Stones(0)
        @test Just4Fun.player_fieldstones(state, 2, 3, Player(2)) == Stones(0)
        @test Just4Fun.player_fieldstones(state, 3, 3, Player(2)) == Stones(0)
        @test Just4Fun.player_fieldstones(state, 4, 3, Player(2)) == Stones(0)
        @test Just4Fun.player_fieldstones(state, 1, 4, Player(2)) == Stones(1)
        @test Just4Fun.player_fieldstones(state, 2, 4, Player(2)) == Stones(0)
        @test Just4Fun.player_fieldstones(state, 3, 4, Player(2)) == Stones(0)
        @test Just4Fun.player_fieldstones(state, 4, 4, Player(2)) == Stones(2)
    end

    @testset "2" begin
        state::Just4FunEnvState = (
            stack = Vector{CardValue}(),
            used_cards = Cards(),
            player_cards = Matrix{CardValue}([
                0x01 0x01
                0x02 0x02
                0x03 0x03
                0x04 0x04
            ]),
            field_stones = Array{Stones}(
                [
                    # p1
                    0x01 0x09 0x03 0x01; 0x01 0x00 0x05 0x00; 0x02 0x07 0x00 0x09;;;
                    # p2
                    0x00 0x00 0x02 0x07; 0x02 0x03 0x04 0x09; 0x08 0x01 0x03 0x00
                ],
            ),
            player_stones = Vector{Stones}(repeat([Stones(20)], 2)),
            curplayer = Player(Just4Fun.YELLOW),
            state = in_progress,
            winner = Player(0),
            actions = [1],
        )

        @test Just4Fun.player_fieldstones(state, 1, 1, Player(1)) == Stones(1)
        @test Just4Fun.player_fieldstones(state, 2, 1, Player(1)) == Stones(9)
        @test Just4Fun.player_fieldstones(state, 3, 1, Player(1)) == Stones(3)
        @test Just4Fun.player_fieldstones(state, 4, 1, Player(1)) == Stones(1)
        @test Just4Fun.player_fieldstones(state, 1, 2, Player(1)) == Stones(1)
        @test Just4Fun.player_fieldstones(state, 2, 2, Player(1)) == Stones(0)
        @test Just4Fun.player_fieldstones(state, 3, 2, Player(1)) == Stones(5)
        @test Just4Fun.player_fieldstones(state, 4, 2, Player(1)) == Stones(0)
        @test Just4Fun.player_fieldstones(state, 1, 3, Player(1)) == Stones(2)
        @test Just4Fun.player_fieldstones(state, 2, 3, Player(1)) == Stones(7)
        @test Just4Fun.player_fieldstones(state, 3, 3, Player(1)) == Stones(0)
        @test Just4Fun.player_fieldstones(state, 4, 3, Player(1)) == Stones(9)

        @test Just4Fun.player_fieldstones(state, 1, 1, Player(2)) == Stones(0)
        @test Just4Fun.player_fieldstones(state, 2, 1, Player(2)) == Stones(0)
        @test Just4Fun.player_fieldstones(state, 3, 1, Player(2)) == Stones(2)
        @test Just4Fun.player_fieldstones(state, 4, 1, Player(2)) == Stones(7)
        @test Just4Fun.player_fieldstones(state, 1, 2, Player(2)) == Stones(2)
        @test Just4Fun.player_fieldstones(state, 2, 2, Player(2)) == Stones(3)
        @test Just4Fun.player_fieldstones(state, 3, 2, Player(2)) == Stones(4)
        @test Just4Fun.player_fieldstones(state, 4, 2, Player(2)) == Stones(9)
        @test Just4Fun.player_fieldstones(state, 1, 3, Player(2)) == Stones(8)
        @test Just4Fun.player_fieldstones(state, 2, 3, Player(2)) == Stones(1)
        @test Just4Fun.player_fieldstones(state, 3, 3, Player(2)) == Stones(3)
        @test Just4Fun.player_fieldstones(state, 4, 3, Player(2)) == Stones(0)
    end
end
