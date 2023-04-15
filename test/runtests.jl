using Just4Fun
using Test
using Just4Fun.AlphaZero
using Just4Fun.Random
using Just4Fun.StaticArrays
using Just4Fun.DataStructures

@testset verbose = true "Just4Fun.jl" begin
    @testset verbose = true "Just4Fun Unit Tests" begin
        @testset verbose = true "Spec tests" begin
            include("unit/structs.jl")
        end
        @testset verbose = true "Game" begin
            @testset verbose = true "Rules tests" begin
                include("unit/game/rules.jl")
            end
            @testset verbose = true "GI tests" begin
                include("unit/game/game.jl")
            end
            @testset verbose = true "Utils tests" begin
                include("unit/game/utils.jl")
            end
        end
        @testset verbose = true "Players" begin
            @testset verbose = true "Minimax tests" begin
                include("unit/player/minimax.jl")
            end
        end
    end
end
