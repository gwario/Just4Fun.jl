@testset "flip_colors" begin
    @testset "returns array circular shifted" begin

        @test Just4Fun.flip_colors(SVector{2,Stones}([Stones(2), Stones(1)])) ==
              SVector{2,Stones}([Stones(1), Stones(2)])

        @test Just4Fun.flip_colors(SVector{3,Stones}([Stones(1), Stones(2), Stones(3)])) ==
              SVector{3,Stones}([Stones(2), Stones(3), Stones(1)])

    end
end

######

@testset "to index" begin
    @test Just4Fun.to_index(Just4Fun.YELLOW) == 1
    @test Just4Fun.to_index(Just4Fun.RED) == 2
    @test Just4Fun.to_index(Just4Fun.MAGENTA) == 3
    @test Just4Fun.to_index(Just4Fun.GREEN) == 4
end

######

@testset "shuffle" begin
    Random.seed!(123)
    cards = [CardValue(1), CardValue(2), CardValue(3), CardValue(4)]
    shuffled_cards = Just4Fun.shuffle(cards)
    @test collect(Iterators.reverse(shuffled_cards)) != cards
    @test issetequal(collect(Iterators.reverse(shuffled_cards)), cards)
end

######

@testset "Base.copy" begin

    stack = Stack{CardValue}()
    push!(stack, CardValue(1))
    push!(stack, CardValue(2))
    push!(stack, CardValue(3))
    push!(stack, CardValue(4))

    stack_copy = copy(stack)

    @test length(stack) == 4
    @test length(stack_copy) == 4
    @test stack == stack_copy

    pop!(stack_copy)

    @test length(stack) == 4
    @test length(stack_copy) == 3
    @test stack != stack_copy

end

######

@testset "regular_combinations" begin
    spec = Just4FunSpec()


    # all combinations of size up to 0 (only the empty list)
    combinations = Just4Fun.regular_combinations(
        spec,
        SVector{4,CardValue}([CardValue(1), CardValue(2), CardValue(3), CardValue(4)]),
    )

    @test issetequal(
        combinations,
        [
            Cards([CardValue(1)]),
            Cards([CardValue(2)]),
            Cards([CardValue(3)]),
            Cards([CardValue(4)]),
            Cards([CardValue(1), CardValue(2)]),
            Cards([CardValue(1), CardValue(3)]),
            Cards([CardValue(1), CardValue(4)]),
            Cards([CardValue(2), CardValue(3)]),
            Cards([CardValue(2), CardValue(4)]),
            Cards([CardValue(3), CardValue(4)]),
            Cards([CardValue(1), CardValue(2), CardValue(3)]),
            Cards([CardValue(1), CardValue(2), CardValue(4)]),
            Cards([CardValue(1), CardValue(3), CardValue(4)]),
            Cards([CardValue(2), CardValue(3), CardValue(4)]),
            Cards([CardValue(1), CardValue(2), CardValue(3), CardValue(4)]),
        ],
    )

end