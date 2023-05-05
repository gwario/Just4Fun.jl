@testset "dominating" begin

    @test Just4Fun.dominating(SVector(FieldValue(2), FieldValue(0)), Player(YELLOW)) == true

    @test Just4Fun.dominating(SVector(FieldValue(1), FieldValue(0)), Player(YELLOW)) == false

    @test Just4Fun.dominating(SVector(FieldValue(0), FieldValue(1)), Player(YELLOW)) == false

    @test Just4Fun.dominating(SVector(FieldValue(3), FieldValue(3)), Player(YELLOW)) == false

    ##

    @test Just4Fun.dominating(SVector(FieldValue(0), FieldValue(2)), Player(RED)) == true

    @test Just4Fun.dominating(SVector(FieldValue(0), FieldValue(1)), Player(RED)) == false

    @test Just4Fun.dominating(SVector(FieldValue(1), FieldValue(0)), Player(RED)) == false

    @test Just4Fun.dominating(SVector(FieldValue(3), FieldValue(3)), Player(RED)) == false

    ##

    @test Just4Fun.dominating(SVector(FieldValue(2), FieldValue(0)), Player(YELLOW)) == true

    @test Just4Fun.dominating(SVector(FieldValue(3), FieldValue(1)), Player(YELLOW)) == true

    @test Just4Fun.dominating(SVector(FieldValue(0), FieldValue(2)), Player(RED)) == true

    @test Just4Fun.dominating(SVector(FieldValue(1), FieldValue(3)), Player(RED)) == true

end
