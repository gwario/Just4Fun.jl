@testset "has_majority" begin

    @test Just4Fun.has_majority(SVector(FieldValue(1), FieldValue(0)), Player(YELLOW)) == true

    @test Just4Fun.has_majority(SVector(FieldValue(1), FieldValue(0)), Player(RED)) == false

    @test Just4Fun.has_majority(SVector(FieldValue(2), FieldValue(0)), Player(YELLOW)) == true

    @test Just4Fun.has_majority(SVector(FieldValue(2), FieldValue(0)), Player(RED)) == false

    @test Just4Fun.has_majority(SVector(FieldValue(2), FieldValue(1)), Player(YELLOW)) == true

    @test Just4Fun.has_majority(SVector(FieldValue(2), FieldValue(1)), Player(RED)) == false

    ##

    @test Just4Fun.has_majority(SVector(FieldValue(0), FieldValue(1)), Player(RED)) == true

    @test Just4Fun.has_majority(SVector(FieldValue(0), FieldValue(1)), Player(YELLOW)) == false

    @test Just4Fun.has_majority(SVector(FieldValue(0), FieldValue(2)), Player(RED)) == true

    @test Just4Fun.has_majority(SVector(FieldValue(0), FieldValue(2)), Player(YELLOW)) == false

    @test Just4Fun.has_majority(SVector(FieldValue(1), FieldValue(2)), Player(RED)) == true

    @test Just4Fun.has_majority(SVector(FieldValue(1), FieldValue(2)), Player(YELLOW)) == false

    ##

    @test Just4Fun.has_majority(SVector(FieldValue(0), FieldValue(0)), Player(YELLOW)) == false

    @test Just4Fun.has_majority(SVector(FieldValue(0), FieldValue(0)), Player(RED)) == false

    @test Just4Fun.has_majority(SVector(FieldValue(2), FieldValue(2)), Player(YELLOW)) == false

    @test Just4Fun.has_majority(SVector(FieldValue(2), FieldValue(2)), Player(RED)) == false

    # TODO make game spec parametrized for size and player no, add tests for more than 2
end
