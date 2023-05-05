@testset "dominated" begin

    @test Just4Fun.dominated(SVector(FieldValue(2), FieldValue(0)), Player(YELLOW)) == false

    @test Just4Fun.dominated(SVector(FieldValue(1), FieldValue(0)), Player(YELLOW)) == false

    @test Just4Fun.dominated(SVector(FieldValue(0), FieldValue(1)), Player(YELLOW)) == false

    @test Just4Fun.dominated(SVector(FieldValue(3), FieldValue(3)), Player(YELLOW)) == false

    ##

    @test Just4Fun.dominated(SVector(FieldValue(0), FieldValue(2)), Player(RED)) == false

    @test Just4Fun.dominated(SVector(FieldValue(0), FieldValue(1)), Player(RED)) == false

    @test Just4Fun.dominated(SVector(FieldValue(1), FieldValue(0)), Player(RED)) == false

    @test Just4Fun.dominated(SVector(FieldValue(3), FieldValue(3)), Player(RED)) == false

    ##

    @test Just4Fun.dominated(SVector(FieldValue(2), FieldValue(0)), Player(YELLOW)) == false

    @test Just4Fun.dominated(SVector(FieldValue(3), FieldValue(1)), Player(YELLOW)) == false

    @test Just4Fun.dominated(SVector(FieldValue(0), FieldValue(2)), Player(RED)) == false

    @test Just4Fun.dominated(SVector(FieldValue(1), FieldValue(3)), Player(RED)) == false

end
