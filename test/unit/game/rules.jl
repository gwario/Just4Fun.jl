@testset "has_majority" begin
  
  @test Just4Fun.has_majority(
    SVector(Just4Fun.FieldValue(1), Just4Fun.FieldValue(0)),
    Just4Fun.Player(Just4Fun.YELLOW)
  ) == true
  
  @test Just4Fun.has_majority(
    SVector(Just4Fun.FieldValue(1), Just4Fun.FieldValue(0)),
    Just4Fun.Player(Just4Fun.RED)
  ) == false

  @test Just4Fun.has_majority(
    SVector(Just4Fun.FieldValue(2), Just4Fun.FieldValue(0)),
    Just4Fun.Player(Just4Fun.YELLOW)
  ) == true

  @test Just4Fun.has_majority(
    SVector(Just4Fun.FieldValue(2), Just4Fun.FieldValue(0)),
    Just4Fun.Player(Just4Fun.RED)
  ) == false

  @test Just4Fun.has_majority(
    SVector(Just4Fun.FieldValue(2), Just4Fun.FieldValue(1)),
    Just4Fun.Player(Just4Fun.YELLOW)
  ) == true

  @test Just4Fun.has_majority(
    SVector(Just4Fun.FieldValue(2), Just4Fun.FieldValue(1)),
    Just4Fun.Player(Just4Fun.RED)
  ) == false

  ##

  @test Just4Fun.has_majority(
    SVector(Just4Fun.FieldValue(0), Just4Fun.FieldValue(1)),
    Just4Fun.Player(Just4Fun.RED)
  ) == true
  
  @test Just4Fun.has_majority(
    SVector(Just4Fun.FieldValue(0), Just4Fun.FieldValue(1)),
    Just4Fun.Player(Just4Fun.YELLOW)
  ) == false

  @test Just4Fun.has_majority(
    SVector(Just4Fun.FieldValue(0), Just4Fun.FieldValue(2)),
    Just4Fun.Player(Just4Fun.RED)
  ) == true

  @test Just4Fun.has_majority(
    SVector(Just4Fun.FieldValue(0), Just4Fun.FieldValue(2)),
    Just4Fun.Player(Just4Fun.YELLOW)
  ) == false

  @test Just4Fun.has_majority(
    SVector(Just4Fun.FieldValue(1), Just4Fun.FieldValue(2)),
    Just4Fun.Player(Just4Fun.RED)
  ) == true

  @test Just4Fun.has_majority(
    SVector(Just4Fun.FieldValue(1), Just4Fun.FieldValue(2)),
    Just4Fun.Player(Just4Fun.YELLOW)
  ) == false

  ##

  @test Just4Fun.has_majority(
    SVector(Just4Fun.FieldValue(0), Just4Fun.FieldValue(0)),
    Just4Fun.Player(Just4Fun.YELLOW)
  ) == false

  @test Just4Fun.has_majority(
    SVector(Just4Fun.FieldValue(0), Just4Fun.FieldValue(0)),
    Just4Fun.Player(Just4Fun.RED)
  ) == false

  @test Just4Fun.has_majority(
    SVector(Just4Fun.FieldValue(2), Just4Fun.FieldValue(2)),
    Just4Fun.Player(Just4Fun.YELLOW)
  ) == false

  @test Just4Fun.has_majority(
    SVector(Just4Fun.FieldValue(2), Just4Fun.FieldValue(2)),
    Just4Fun.Player(Just4Fun.RED)
  ) == false

  # TODO make game spec parametrized for size and player no, add tests for more than 2
end

######

@testset "has_minority" begin
  
  @test Just4Fun.has_minority(
    SVector(Just4Fun.FieldValue(1), Just4Fun.FieldValue(0)),
    Just4Fun.Player(Just4Fun.YELLOW)
  ) == false
  
  @test Just4Fun.has_minority(
    SVector(Just4Fun.FieldValue(1), Just4Fun.FieldValue(0)),
    Just4Fun.Player(Just4Fun.RED)
  ) == true

  @test Just4Fun.has_minority(
    SVector(Just4Fun.FieldValue(2), Just4Fun.FieldValue(0)),
    Just4Fun.Player(Just4Fun.YELLOW)
  ) == false

  @test Just4Fun.has_minority(
    SVector(Just4Fun.FieldValue(2), Just4Fun.FieldValue(0)),
    Just4Fun.Player(Just4Fun.RED)
  ) == true

  @test Just4Fun.has_minority(
    SVector(Just4Fun.FieldValue(2), Just4Fun.FieldValue(1)),
    Just4Fun.Player(Just4Fun.YELLOW)
  ) == false

  @test Just4Fun.has_minority(
    SVector(Just4Fun.FieldValue(2), Just4Fun.FieldValue(1)),
    Just4Fun.Player(Just4Fun.RED)
  ) == true

  ##

  @test Just4Fun.has_minority(
    SVector(Just4Fun.FieldValue(0), Just4Fun.FieldValue(1)),
    Just4Fun.Player(Just4Fun.RED)
  ) == false
  
  @test Just4Fun.has_minority(
    SVector(Just4Fun.FieldValue(0), Just4Fun.FieldValue(1)),
    Just4Fun.Player(Just4Fun.YELLOW)
  ) == true

  @test Just4Fun.has_minority(
    SVector(Just4Fun.FieldValue(0), Just4Fun.FieldValue(2)),
    Just4Fun.Player(Just4Fun.RED)
  ) == false

  @test Just4Fun.has_minority(
    SVector(Just4Fun.FieldValue(0), Just4Fun.FieldValue(2)),
    Just4Fun.Player(Just4Fun.YELLOW)
  ) == true

  @test Just4Fun.has_minority(
    SVector(Just4Fun.FieldValue(1), Just4Fun.FieldValue(2)),
    Just4Fun.Player(Just4Fun.RED)
  ) == false

  @test Just4Fun.has_minority(
    SVector(Just4Fun.FieldValue(1), Just4Fun.FieldValue(2)),
    Just4Fun.Player(Just4Fun.YELLOW)
  ) == true

  ##

  @test Just4Fun.has_minority(
    SVector(Just4Fun.FieldValue(0), Just4Fun.FieldValue(0)),
    Just4Fun.Player(Just4Fun.YELLOW)
  ) == false

  @test Just4Fun.has_minority(
    SVector(Just4Fun.FieldValue(0), Just4Fun.FieldValue(0)),
    Just4Fun.Player(Just4Fun.RED)
  ) == false

  @test Just4Fun.has_minority(
    SVector(Just4Fun.FieldValue(2), Just4Fun.FieldValue(2)),
    Just4Fun.Player(Just4Fun.YELLOW)
  ) == false

  @test Just4Fun.has_minority(
    SVector(Just4Fun.FieldValue(2), Just4Fun.FieldValue(2)),
    Just4Fun.Player(Just4Fun.RED)
  ) == false

  # TODO make game spec parametrized for size and player no, add tests for more than 2
end

######

@testset "dominated" begin
  
  @test Just4Fun.dominated(
    SVector(Just4Fun.FieldValue(2), Just4Fun.FieldValue(0)),
    Just4Fun.Player(Just4Fun.YELLOW)
  ) == false

  @test Just4Fun.dominated(
    SVector(Just4Fun.FieldValue(1), Just4Fun.FieldValue(0)),
    Just4Fun.Player(Just4Fun.YELLOW)
  ) == false

  @test Just4Fun.dominated(
    SVector(Just4Fun.FieldValue(0), Just4Fun.FieldValue(1)),
    Just4Fun.Player(Just4Fun.YELLOW)
  ) == false

  @test Just4Fun.dominated(
    SVector(Just4Fun.FieldValue(3), Just4Fun.FieldValue(3)),
    Just4Fun.Player(Just4Fun.YELLOW)
  ) == false

  ##

  @test Just4Fun.dominated(
    SVector(Just4Fun.FieldValue(0), Just4Fun.FieldValue(2)),
    Just4Fun.Player(Just4Fun.RED)
  ) == false

  @test Just4Fun.dominated(
    SVector(Just4Fun.FieldValue(0), Just4Fun.FieldValue(1)),
    Just4Fun.Player(Just4Fun.RED)
  ) == false

  @test Just4Fun.dominated(
    SVector(Just4Fun.FieldValue(1), Just4Fun.FieldValue(0)),
    Just4Fun.Player(Just4Fun.RED)
  ) == false

  @test Just4Fun.dominated(
    SVector(Just4Fun.FieldValue(3), Just4Fun.FieldValue(3)),
    Just4Fun.Player(Just4Fun.RED)
  ) == false

  ##

  @test Just4Fun.dominated(
    SVector(Just4Fun.FieldValue(2), Just4Fun.FieldValue(0)),
    Just4Fun.Player(Just4Fun.YELLOW)
  ) == false

  @test Just4Fun.dominated(
    SVector(Just4Fun.FieldValue(3), Just4Fun.FieldValue(1)),
    Just4Fun.Player(Just4Fun.YELLOW)
  ) == false

  @test Just4Fun.dominated(
    SVector(Just4Fun.FieldValue(0), Just4Fun.FieldValue(2)),
    Just4Fun.Player(Just4Fun.RED)
  ) == false

  @test Just4Fun.dominated(
    SVector(Just4Fun.FieldValue(1), Just4Fun.FieldValue(3)),
    Just4Fun.Player(Just4Fun.RED)
  ) == false

end

######

@testset "dominating" begin
  
  @test Just4Fun.dominating(
    SVector(Just4Fun.FieldValue(2), Just4Fun.FieldValue(0)),
    Just4Fun.Player(Just4Fun.YELLOW)
  ) == true

  @test Just4Fun.dominating(
    SVector(Just4Fun.FieldValue(1), Just4Fun.FieldValue(0)),
    Just4Fun.Player(Just4Fun.YELLOW)
  ) == false

  @test Just4Fun.dominating(
    SVector(Just4Fun.FieldValue(0), Just4Fun.FieldValue(1)),
    Just4Fun.Player(Just4Fun.YELLOW)
  ) == false

  @test Just4Fun.dominating(
    SVector(Just4Fun.FieldValue(3), Just4Fun.FieldValue(3)),
    Just4Fun.Player(Just4Fun.YELLOW)
  ) == false

  ##

  @test Just4Fun.dominating(
    SVector(Just4Fun.FieldValue(0), Just4Fun.FieldValue(2)),
    Just4Fun.Player(Just4Fun.RED)
  ) == true

  @test Just4Fun.dominating(
    SVector(Just4Fun.FieldValue(0), Just4Fun.FieldValue(1)),
    Just4Fun.Player(Just4Fun.RED)
  ) == false

  @test Just4Fun.dominating(
    SVector(Just4Fun.FieldValue(1), Just4Fun.FieldValue(0)),
    Just4Fun.Player(Just4Fun.RED)
  ) == false

  @test Just4Fun.dominating(
    SVector(Just4Fun.FieldValue(3), Just4Fun.FieldValue(3)),
    Just4Fun.Player(Just4Fun.RED)
  ) == false

  ##

  @test Just4Fun.dominating(
    SVector(Just4Fun.FieldValue(2), Just4Fun.FieldValue(0)),
    Just4Fun.Player(Just4Fun.YELLOW)
  ) == true

  @test Just4Fun.dominating(
    SVector(Just4Fun.FieldValue(3), Just4Fun.FieldValue(1)),
    Just4Fun.Player(Just4Fun.YELLOW)
  ) == true

  @test Just4Fun.dominating(
    SVector(Just4Fun.FieldValue(0), Just4Fun.FieldValue(2)),
    Just4Fun.Player(Just4Fun.RED)
  ) == true

  @test Just4Fun.dominating(
    SVector(Just4Fun.FieldValue(1), Just4Fun.FieldValue(3)),
    Just4Fun.Player(Just4Fun.RED)
  ) == true

end

######

@testset "dominant_player" begin
  
  @test Just4Fun.dominant_player(
    SVector(Just4Fun.FieldValue(0), Just4Fun.FieldValue(0))
    ) != Just4Fun.Player(Just4Fun.YELLOW)
  @test Just4Fun.dominant_player(
    SVector(Just4Fun.FieldValue(0), Just4Fun.FieldValue(0))
    ) != Just4Fun.Player(Just4Fun.RED)
  @test Just4Fun.dominant_player(
    SVector(Just4Fun.FieldValue(0), Just4Fun.FieldValue(0))
    ) != Just4Fun.Player(Just4Fun.GREEN)
  @test Just4Fun.dominant_player(
    SVector(Just4Fun.FieldValue(0), Just4Fun.FieldValue(0))
    ) != Just4Fun.Player(Just4Fun.MAGENTA)

  @test Just4Fun.dominant_player(
    SVector(Just4Fun.FieldValue(1), Just4Fun.FieldValue(1))
    ) != Just4Fun.Player(Just4Fun.YELLOW)
  @test Just4Fun.dominant_player(
    SVector(Just4Fun.FieldValue(1), Just4Fun.FieldValue(1))
    ) != Just4Fun.Player(Just4Fun.RED)
  @test Just4Fun.dominant_player(
    SVector(Just4Fun.FieldValue(1), Just4Fun.FieldValue(1))
    ) != Just4Fun.Player(Just4Fun.GREEN)
  @test Just4Fun.dominant_player(
    SVector(Just4Fun.FieldValue(1), Just4Fun.FieldValue(1))
    ) != Just4Fun.Player(Just4Fun.MAGENTA)

  ##
  
  @test Just4Fun.dominant_player(
    SVector(Just4Fun.FieldValue(1), Just4Fun.FieldValue(0))
    ) != Just4Fun.Player(Just4Fun.YELLOW)
  @test Just4Fun.dominant_player(
    SVector(Just4Fun.FieldValue(1), Just4Fun.FieldValue(0))
    ) != Just4Fun.Player(Just4Fun.RED)
  @test Just4Fun.dominant_player(
    SVector(Just4Fun.FieldValue(1), Just4Fun.FieldValue(0))
    ) != Just4Fun.Player(Just4Fun.GREEN)
  @test Just4Fun.dominant_player(
    SVector(Just4Fun.FieldValue(1), Just4Fun.FieldValue(0))
    ) != Just4Fun.Player(Just4Fun.MAGENTA)

  @test Just4Fun.dominant_player(
    SVector(Just4Fun.FieldValue(2), Just4Fun.FieldValue(0))
    ) == Just4Fun.Player(Just4Fun.YELLOW)
  @test Just4Fun.dominant_player(
    SVector(Just4Fun.FieldValue(3), Just4Fun.FieldValue(1))
    ) == Just4Fun.Player(Just4Fun.YELLOW)
  @test Just4Fun.dominant_player(
    SVector(Just4Fun.FieldValue(4), Just4Fun.FieldValue(2))
    ) == Just4Fun.Player(Just4Fun.YELLOW)
  
  ##

  @test Just4Fun.dominant_player(
    SVector(Just4Fun.FieldValue(0), Just4Fun.FieldValue(1))
    ) != Just4Fun.Player(Just4Fun.YELLOW)
  @test Just4Fun.dominant_player(
    SVector(Just4Fun.FieldValue(0), Just4Fun.FieldValue(1))
    ) != Just4Fun.Player(Just4Fun.RED)
  @test Just4Fun.dominant_player(
    SVector(Just4Fun.FieldValue(0), Just4Fun.FieldValue(1))
    ) != Just4Fun.Player(Just4Fun.GREEN)
  @test Just4Fun.dominant_player(
    SVector(Just4Fun.FieldValue(0), Just4Fun.FieldValue(1))
    ) != Just4Fun.Player(Just4Fun.MAGENTA)

  @test Just4Fun.dominant_player(
    SVector(Just4Fun.FieldValue(0), Just4Fun.FieldValue(2))
    ) == Just4Fun.Player(Just4Fun.RED)
  @test Just4Fun.dominant_player(
    SVector(Just4Fun.FieldValue(1), Just4Fun.FieldValue(3))
    ) == Just4Fun.Player(Just4Fun.RED)
  @test Just4Fun.dominant_player(
    SVector(Just4Fun.FieldValue(2), Just4Fun.FieldValue(4))
    ) == Just4Fun.Player(Just4Fun.RED)
  
end

#######

@testset "is_available" begin
  
  @test Just4Fun.is_available(
    SVector(Just4Fun.FieldValue(0), Just4Fun.FieldValue(0)),
    Just4Fun.Player(Just4Fun.YELLOW)
  )
  @test Just4Fun.is_available(
    SVector(Just4Fun.FieldValue(0), Just4Fun.FieldValue(0)),
    Just4Fun.Player(Just4Fun.RED)
  )
  #@test Just4Fun.is_available(
  #  SVector(Just4Fun.FieldValue(0), Just4Fun.FieldValue(0)),
  #  Just4Fun.Player(Just4Fun.GREEN)
  #)
  #@test Just4Fun.is_available(
  #  SVector(Just4Fun.FieldValue(0), Just4Fun.FieldValue(0)),
  #  Just4Fun.Player(Just4Fun.MAGENTA)
  #)
  ##
  @test Just4Fun.is_available(
    SVector(Just4Fun.FieldValue(1), Just4Fun.FieldValue(1)),
    Just4Fun.Player(Just4Fun.YELLOW)
  )
  @test Just4Fun.is_available(
    SVector(Just4Fun.FieldValue(1), Just4Fun.FieldValue(1)),
    Just4Fun.Player(Just4Fun.RED)
  )
  #@test Just4Fun.is_available(
  #  SVector(Just4Fun.FieldValue(1), Just4Fun.FieldValue(1)),
  #  Just4Fun.Player(Just4Fun.GREEN)
  #)
  #@test Just4Fun.is_available(
  #  SVector(Just4Fun.FieldValue(1), Just4Fun.FieldValue(1)),
  #  Just4Fun.Player(Just4Fun.MAGENTA)
  #)
  ##
  @test Just4Fun.is_available(
    SVector(Just4Fun.FieldValue(1), Just4Fun.FieldValue(0)),
    Just4Fun.Player(Just4Fun.YELLOW)
  )
  @test Just4Fun.is_available(
    SVector(Just4Fun.FieldValue(1), Just4Fun.FieldValue(0)),
    Just4Fun.Player(Just4Fun.RED)
  )
  #@test Just4Fun.is_available(
  #  SVector(Just4Fun.FieldValue(1), Just4Fun.FieldValue(0)),
  #  Just4Fun.Player(Just4Fun.GREEN)
  #)
  #@test Just4Fun.is_available(
  #  SVector(Just4Fun.FieldValue(1), Just4Fun.FieldValue(0)),
  #  Just4Fun.Player(Just4Fun.MAGENTA)
  #)
  ##
  @test Just4Fun.is_available(
    SVector(Just4Fun.FieldValue(0), Just4Fun.FieldValue(1)),
    Just4Fun.Player(Just4Fun.YELLOW)
  )
  @test Just4Fun.is_available(
    SVector(Just4Fun.FieldValue(0), Just4Fun.FieldValue(1)),
    Just4Fun.Player(Just4Fun.RED)
  )
  #@test Just4Fun.is_available(
  #  SVector(Just4Fun.FieldValue(0), Just4Fun.FieldValue(1)),
  #  Just4Fun.Player(Just4Fun.GREEN)
  #)
  #@test Just4Fun.is_available(
  #  SVector(Just4Fun.FieldValue(0), Just4Fun.FieldValue(1)),
  #  Just4Fun.Player(Just4Fun.MAGENTA)
  #)
  ##
  @test Just4Fun.is_available(
    SVector(Just4Fun.FieldValue(2), Just4Fun.FieldValue(0)),
    Just4Fun.Player(Just4Fun.YELLOW)
  ) == false
  @test Just4Fun.is_available(
    SVector(Just4Fun.FieldValue(2), Just4Fun.FieldValue(0)),
    Just4Fun.Player(Just4Fun.RED)
  ) == false
  #@test Just4Fun.is_available(
  #  SVector(Just4Fun.FieldValue(2), Just4Fun.FieldValue(0)),
  #  Just4Fun.Player(Just4Fun.GREEN)
  #) == false
  #@test Just4Fun.is_available(
  #  SVector(Just4Fun.FieldValue(2), Just4Fun.FieldValue(0)),
  #  Just4Fun.Player(Just4Fun.MAGENTA)
  #) == false
  ##
  @test Just4Fun.is_available(
    SVector(Just4Fun.FieldValue(0), Just4Fun.FieldValue(2)),
    Just4Fun.Player(Just4Fun.YELLOW)
  ) == false
  @test Just4Fun.is_available(
    SVector(Just4Fun.FieldValue(0), Just4Fun.FieldValue(2)),
    Just4Fun.Player(Just4Fun.RED)
  ) == false
  #@test Just4Fun.is_available(
  #  SVector(Just4Fun.FieldValue(0), Just4Fun.FieldValue(2)),
  #  Just4Fun.Player(Just4Fun.GREEN)
  #) == false
  #@test Just4Fun.is_available(
  #  SVector(Just4Fun.FieldValue(0), Just4Fun.FieldValue(2)),
  #  Just4Fun.Player(Just4Fun.MAGENTA)
  #) == false
  ##
  @test Just4Fun.is_available(
    SVector(Just4Fun.FieldValue(2), Just4Fun.FieldValue(4)),
    Just4Fun.Player(Just4Fun.YELLOW)
  ) == false
  @test Just4Fun.is_available(
    SVector(Just4Fun.FieldValue(2), Just4Fun.FieldValue(4)),
    Just4Fun.Player(Just4Fun.RED)
  ) == false
  ##
  @test Just4Fun.is_available(
    SVector(Just4Fun.FieldValue(2), Just4Fun.FieldValue(4)),
    Just4Fun.Player(Just4Fun.YELLOW)
  ) == false
  ##
  #@test Just4Fun.is_available(
  #  SVector(Just4Fun.FieldValue(2), Just4Fun.FieldValue(4), Just4Fun.FieldValue(2), Just4Fun.FieldValue(4)),
  #  Just4Fun.Player(Just4Fun.YELLOW)
  #) == false
  #@test Just4Fun.is_available(
  #  SVector(Just4Fun.FieldValue(2), Just4Fun.FieldValue(4), Just4Fun.FieldValue(2), Just4Fun.FieldValue(4)),
  #  Just4Fun.Player(Just4Fun.RED)
  #) == true
  #@test Just4Fun.is_available(
  #  SVector(Just4Fun.FieldValue(2), Just4Fun.FieldValue(4), Just4Fun.FieldValue(2), Just4Fun.FieldValue(4)),
  #  Just4Fun.Player(Just4Fun.GREEN)
  #) == false
  #@test Just4Fun.is_available(
  #  SVector(Just4Fun.FieldValue(2), Just4Fun.FieldValue(4), Just4Fun.FieldValue(2), Just4Fun.FieldValue(4)),
  #  Just4Fun.Player(Just4Fun.MAGENTA)
  #) == true
end

# TODO: add test for fields_reachability

#######

@testset "take_stone!" begin
  @testset "yellow" begin
    
    game = GI.init(Just4Fun.Just4FunSpec())
    
    game.curplayer = Just4Fun.Player(Just4Fun.YELLOW)
    # precondition
    @test game.player_stones == SVector(Just4Fun.FieldValue(20), Just4Fun.FieldValue(20))
    Just4Fun.take_stone!(game)
    @test game.player_stones == SVector(Just4Fun.FieldValue(19), Just4Fun.FieldValue(20))
    Just4Fun.take_stone!(game)
    @test game.player_stones == SVector(Just4Fun.FieldValue(18), Just4Fun.FieldValue(20))
    Just4Fun.take_stone!(game)
    @test game.player_stones == SVector(Just4Fun.FieldValue(17), Just4Fun.FieldValue(20))
  end

  @testset "red" begin
    game = GI.init(Just4Fun.Just4FunSpec())
    game.curplayer = Player(Just4Fun.RED)
    # precondition
    @test game.player_stones == SVector(Just4Fun.FieldValue(20), Just4Fun.FieldValue(20))
    Just4Fun.take_stone!(game)
    @test game.player_stones == SVector(Just4Fun.FieldValue(20), Just4Fun.FieldValue(19))
    Just4Fun.take_stone!(game)
    @test game.player_stones == SVector(Just4Fun.FieldValue(20), Just4Fun.FieldValue(18))
    Just4Fun.take_stone!(game)
    @test game.player_stones == SVector(Just4Fun.FieldValue(20), Just4Fun.FieldValue(17))
  end

  @testset "both" begin
    game = GI.init(Just4Fun.Just4FunSpec())
    game.curplayer = Just4Fun.Player(Just4Fun.RED)
    # precondition
    @test game.player_stones == SVector(Just4Fun.FieldValue(20), Just4Fun.FieldValue(20))
    Just4Fun.take_stone!(game)
    @test game.player_stones == SVector(Just4Fun.FieldValue(20), Just4Fun.FieldValue(19))
    game.curplayer = Just4Fun.Player(Just4Fun.YELLOW)
    Just4Fun.take_stone!(game)
    @test game.player_stones == SVector(Just4Fun.FieldValue(19), Just4Fun.FieldValue(19))
  end
end

#######

@testset "place_stone!+get_stones" begin
  game = GI.init(Just4Fun.Just4FunSpec())
  game.curplayer = Just4Fun.Player(Just4Fun.YELLOW)
  # precondition
  @test Just4Fun.get_stones(game, FieldValue(1)) == SVector(Just4Fun.FieldValue(0), Just4Fun.FieldValue(0))
  @test Just4Fun.get_stones(game, FieldValue(2)) == SVector(Just4Fun.FieldValue(0), Just4Fun.FieldValue(0))
  Just4Fun.place_stone!(game, FieldValue(1))
  @test Just4Fun.get_stones(game, FieldValue(1)) == SVector(Just4Fun.FieldValue(1), Just4Fun.FieldValue(0))
  Just4Fun.place_stone!(game, FieldValue(1))
  @test Just4Fun.get_stones(game, FieldValue(1)) == SVector(Just4Fun.FieldValue(2), Just4Fun.FieldValue(0))
  game.curplayer = Just4Fun.Player(Just4Fun.RED)
  Just4Fun.place_stone!(game, FieldValue(2))
  @test Just4Fun.get_stones(game, FieldValue(1)) == SVector(Just4Fun.FieldValue(2), Just4Fun.FieldValue(0))
  @test Just4Fun.get_stones(game, FieldValue(2)) == SVector(Just4Fun.FieldValue(0), Just4Fun.FieldValue(1))
  Just4Fun.place_stone!(game, FieldValue(2))
  @test Just4Fun.get_stones(game, FieldValue(1)) == SVector(Just4Fun.FieldValue(2), Just4Fun.FieldValue(0))
  @test Just4Fun.get_stones(game, FieldValue(2)) == SVector(Just4Fun.FieldValue(0), Just4Fun.FieldValue(2))
end

########

@testset "put_down!" begin
  player_index = Just4Fun.to_index(Just4Fun.YELLOW)
  game = GI.init(Just4Fun.Just4FunSpec())
  game.player_cards = setindex(game.player_cards, Just4Fun.CardValue(1), CartesianIndex(1, player_index))
  game.player_cards = setindex(game.player_cards, Just4Fun.CardValue(2), CartesianIndex(2, player_index))
  game.player_cards = setindex(game.player_cards, Just4Fun.CardValue(3), CartesianIndex(3, player_index))
  game.player_cards = setindex(game.player_cards, Just4Fun.CardValue(4), CartesianIndex(4, player_index))
  # precondition
  @test game.player_cards[:, player_index] == [Just4Fun.CardValue(1), Just4Fun.CardValue(2), Just4Fun.CardValue(3), Just4Fun.CardValue(4)]

  Just4Fun.put_down!(game, Just4Fun.Cards([Just4Fun.CardValue(4), Just4Fun.CardValue(2)]))

  @test game.used_cards == [Just4Fun.CardValue(4), Just4Fun.CardValue(2)]
  @test game.player_cards[:, player_index] == SVector(
    Just4Fun.CardValue(1), Just4Fun.CardValue(0), Just4Fun.CardValue(3), Just4Fun.CardValue(0)
  )
end

########
if Just4Fun.FEATURE_CARDS
  @testset "pick_cards! both" begin
    stack = Stack{Just4Fun.CardValue}()
    
    push!(stack, Just4Fun.CardValue(7)) # p2
    push!(stack, Just4Fun.CardValue(5)) # p2

    push!(stack, Just4Fun.CardValue(6)) # p1

    push!(stack, Just4Fun.CardValue(3)) # p2

    push!(stack, Just4Fun.CardValue(4)) # p1
    push!(stack, Just4Fun.CardValue(2)) # p1
    # ----------------------------------------
    push!(stack, Just4Fun.CardValue(1)) # p2
    push!(stack, Just4Fun.CardValue(2)) # p1
    push!(stack, Just4Fun.CardValue(1)) # p2
    push!(stack, Just4Fun.CardValue(2)) # p1
    push!(stack, Just4Fun.CardValue(1)) # p2
    push!(stack, Just4Fun.CardValue(2)) # p1
    push!(stack, Just4Fun.CardValue(1)) # p2
    push!(stack, Just4Fun.CardValue(2)) # p1
    
    spec = Just4Fun.Just4FunSpec(stack)
    
    @test length(stack) == 14

    game = GI.init(spec)
    
    # the first 8 cards have been picked on init
    @test game.player_cards == @SMatrix [
      Just4Fun.CardValue(2) Just4Fun.CardValue(1) ;
      Just4Fun.CardValue(2) Just4Fun.CardValue(1) ;
      Just4Fun.CardValue(2) Just4Fun.CardValue(1) ;
      Just4Fun.CardValue(2) Just4Fun.CardValue(1)
    ]
    
    # establish precondition
    game.player_cards = setindex(game.player_cards, Just4Fun.CardValue(0), CartesianIndex(2, 1)) # p1, card 2
    game.player_cards = setindex(game.player_cards, Just4Fun.CardValue(0), CartesianIndex(3, 1)) # p1, card 3
    game.player_cards = setindex(game.player_cards, Just4Fun.CardValue(0), CartesianIndex(4, 1)) # p1, card 4
    game.player_cards = setindex(game.player_cards, Just4Fun.CardValue(0), CartesianIndex(1, 2)) # p1, card 1
    game.player_cards = setindex(game.player_cards, Just4Fun.CardValue(0), CartesianIndex(3, 2)) # p1, card 3
    game.player_cards = setindex(game.player_cards, Just4Fun.CardValue(0), CartesianIndex(4, 2)) # p1, card 4

    @test game.player_cards == @SMatrix [
      Just4Fun.CardValue(2)  Just4Fun.CardValue(0) ;
      Just4Fun.CardValue(0)  Just4Fun.CardValue(1) ;
      Just4Fun.CardValue(0)  Just4Fun.CardValue(0) ;
      Just4Fun.CardValue(0)  Just4Fun.CardValue(0)
    ]

    @test length(game.stack) == 6
    @test game.curplayer == Just4Fun.Player(Just4Fun.YELLOW)

    Just4Fun.pick_cards!(game, 2) # p1 gets 2 and 4 at first free positions which are 2 and 3 

    # post-conditions
    @test length(game.stack) == 4

    @test game.player_cards == @SMatrix [
      Just4Fun.CardValue(2)  Just4Fun.CardValue(0) ;
      Just4Fun.CardValue(2)  Just4Fun.CardValue(1) ;
      Just4Fun.CardValue(4)  Just4Fun.CardValue(0) ;
      Just4Fun.CardValue(0)  Just4Fun.CardValue(0)
    ]

    game.curplayer = Just4Fun.Player(Just4Fun.RED)
    @test game.curplayer == Just4Fun.Player(Just4Fun.RED)

    Just4Fun.pick_cards!(game, 1) # p2 gets 3 at first free positions which is 1 

    # post-conditions
    @test length(game.stack) == 3

    @test game.player_cards == @SMatrix [
      Just4Fun.CardValue(2)  Just4Fun.CardValue(3) ;
      Just4Fun.CardValue(2)  Just4Fun.CardValue(1) ;
      Just4Fun.CardValue(4)  Just4Fun.CardValue(0) ;
      Just4Fun.CardValue(0)  Just4Fun.CardValue(0)
    ]

    game.curplayer = Just4Fun.Player(Just4Fun.YELLOW)
    @test game.curplayer == Just4Fun.Player(Just4Fun.YELLOW)

    Just4Fun.pick_cards!(game, 1) # p1 gets 6 at first free position which is 4

    # post-conditions
    @test length(game.stack) == 2

    @test game.player_cards == @SMatrix [
      Just4Fun.CardValue(2)  Just4Fun.CardValue(3) ;
      Just4Fun.CardValue(2)  Just4Fun.CardValue(1) ;
      Just4Fun.CardValue(4)  Just4Fun.CardValue(0) ;
      Just4Fun.CardValue(6)  Just4Fun.CardValue(0)
    ]

    game.curplayer = Just4Fun.Player(Just4Fun.RED)
    @test game.curplayer == Just4Fun.Player(Just4Fun.RED)

    Just4Fun.pick_cards!(game, 2) # p2 gets 5 and 7 at first free positions which are 3 and 4

    # post-conditions
    @test length(game.stack) == 0

    @test game.player_cards == @SMatrix [
      Just4Fun.CardValue(2)  Just4Fun.CardValue(3) ;
      Just4Fun.CardValue(2)  Just4Fun.CardValue(1) ;
      Just4Fun.CardValue(4)  Just4Fun.CardValue(5) ;
      Just4Fun.CardValue(6)  Just4Fun.CardValue(7)
    ]
  end
else
  @warn "Skipping test for FEATURE CARDS as it is disabled!"
end
##########

if Just4Fun.FEATURE_CARDS
  @testset "isredraw" begin
    @test Just4Fun.isredraw(Just4Fun.CardsAction((cards=[], value=1))) == false
    @test Just4Fun.isredraw(Just4Fun.CardsAction((cards=[Just4Fun.CardValue(0)], value=0))) == false
    @test Just4Fun.isredraw(Just4Fun.CardsAction((cards=[Just4Fun.CardValue(1)], value=0))) == false
    @test Just4Fun.isredraw(Just4Fun.CardsAction((cards=[Just4Fun.CardValue(1), Just4Fun.CardValue(2)], value=1))) == false
    @test Just4Fun.isredraw(Just4Fun.CardsAction((cards=[], value=0))) == true
  end
else
  @warn "Skipping test for FEATURE CARDS as it is disabled!"
end

##########

@testset "empty_field" begin
  if Just4Fun.NUM_PLAYERS == 2
    @test Just4Fun.empty_field(SVector{2, Stones}(zeros(Stones, 2))) == true
    @test Just4Fun.empty_field(SVector{2, Stones}(ones(Stones, 2))) == false
  else
    @warn "Skipping test for 2 players!"
  end

  if Just4Fun.NUM_PLAYERS == 3
    @test Just4Fun.empty_field(SVector(0,1,0)) == false
    @test Just4Fun.empty_field(SVector(2,1,1)) == false
    @test Just4Fun.empty_field(SVector(0,0,0)) == true  
    @test Just4Fun.empty_field(SVector{3, Stones}(zeros(Stones, 3))) == true
    @test Just4Fun.empty_field(SVector{3, Stones}(ones(Stones, 3))) == false
  else
    @warn "Skipping test for 3 players!"
  end

  if Just4Fun.NUM_PLAYERS == 4
    @test Just4Fun.empty_field(SVector{4, Stones}(zeros(Stones, 4))) == true
    @test Just4Fun.empty_field(SVector{4, Stones}(ones(Stones, 4))) == false
  else
    @warn "Skipping test for 4 players!"
  end
end

##########

@testset "next_player" begin
  
  if Just4Fun.NUM_PLAYERS == 2
    @testset "default (2 player)" begin
      # two players default
      spec2 = Just4Fun.Just4FunSpec()
      @test Just4Fun.next_player(spec2, Just4Fun.Player(Just4Fun.YELLOW)) == Just4Fun.Player(Just4Fun.RED)
      @test Just4Fun.next_player(spec2, Just4Fun.Player(Just4Fun.RED)) == Just4Fun.Player(Just4Fun.YELLOW)
    end
  else
    @warn "Skipping test for 2 players!"
  end

  if Just4Fun.NUM_PLAYERS == 3
    @testset "3 player" begin
      spec3 = Just4Fun.Just4FunSpec()
      
      @test Just4Fun.next_player(spec3, Just4Fun.Player(Just4Fun.YELLOW)) == Just4Fun.Player(Just4Fun.RED)
      @test Just4Fun.next_player(spec3, Just4Fun.Player(Just4Fun.RED)) == Just4Fun.Player(Just4Fun.MAGENTA)
      @test Just4Fun.next_player(spec3, Just4Fun.Player(Just4Fun.MAGENTA)) == Just4Fun.Player(Just4Fun.YELLOW)
    end
  else
    @warn "Skipping test for 3 players!"
  end
  
  if Just4Fun.NUM_PLAYERS == 4
    @testset "4 player" begin
      spec4 = Just4Fun.Just4FunSpec()
      
      @test Just4Fun.next_player(spec4, Just4Fun.Player(Just4Fun.YELLOW)) == Just4Fun.Player(Just4Fun.RED)
      @test Just4Fun.next_player(spec4, Just4Fun.Player(Just4Fun.RED)) == Just4Fun.Player(Just4Fun.MAGENTA)
      @test Just4Fun.next_player(spec4, Just4Fun.Player(Just4Fun.MAGENTA)) == Just4Fun.Player(Just4Fun.GREEN)
      @test Just4Fun.next_player(spec4, Just4Fun.Player(Just4Fun.GREEN)) == Just4Fun.Player(Just4Fun.YELLOW)
    end
  else
    @warn "Skipping test for 4 players!"
  end
end

##########

@testset "previous_player" begin

  if Just4Fun.NUM_PLAYERS == 2
    @testset "default (2 player)" begin
      # two players default
      spec2 = Just4Fun.Just4FunSpec()
      @test Just4Fun.previous_player(spec2, Just4Fun.Player(Just4Fun.YELLOW))   == Just4Fun.Player(Just4Fun.RED)
      @test Just4Fun.previous_player(spec2, Just4Fun.Player(Just4Fun.RED))      == Just4Fun.Player(Just4Fun.YELLOW)
    end
  else
    @warn "Skipping test for 2 players!"
  end

  if Just4Fun.NUM_PLAYERS == 3
    @testset "3 player" begin
      spec3 = Just4Fun.Just4FunSpec()
      
      @test Just4Fun.previous_player(spec3, Just4Fun.Player(Just4Fun.YELLOW))   == Just4Fun.Player(Just4Fun.MAGENTA)
      @test Just4Fun.previous_player(spec3, Just4Fun.Player(Just4Fun.RED))      == Just4Fun.Player(Just4Fun.YELLOW)
      @test Just4Fun.previous_player(spec3, Just4Fun.Player(Just4Fun.MAGENTA))  == Just4Fun.Player(Just4Fun.RED)
    end
  else
    @warn "Skipping test for 3 players!"
  end
  
  if Just4Fun.NUM_PLAYERS == 4
    @testset "4 player" begin
      spec4 = Just4Fun.Just4FunSpec()
      
      @test Just4Fun.previous_player(spec4, Just4Fun.Player(Just4Fun.YELLOW))   == Just4Fun.Player(Just4Fun.GREEN)
      @test Just4Fun.previous_player(spec4, Just4Fun.Player(Just4Fun.RED))      == Just4Fun.Player(Just4Fun.YELLOW)
      @test Just4Fun.previous_player(spec4, Just4Fun.Player(Just4Fun.MAGENTA))  == Just4Fun.Player(Just4Fun.RED)
      @test Just4Fun.previous_player(spec4, Just4Fun.Player(Just4Fun.GREEN))    == Just4Fun.Player(Just4Fun.MAGENTA)
    end
  else
    @warn "Skipping test for 4 players!"
  end
end

##########

@testset "is_curplayer_index" begin
  spec = Just4FunSpec()
  game = GI.init(spec)

  @test Just4Fun.is_curplayer_index(game, convert(Int64, Just4Fun.YELLOW))  == true
  @test Just4Fun.is_curplayer_index(game, convert(Int64, Just4Fun.RED))     == false
  @test Just4Fun.is_curplayer_index(game, convert(Int64, Just4Fun.GREEN))   == false
  @test Just4Fun.is_curplayer_index(game, convert(Int64, Just4Fun.MAGENTA)) == false
end

##########

if Just4Fun.FEATURE_CARDS
  @testset "curplayercards" begin
    stack = Stack{Just4Fun.CardValue}()
    push!(stack, Just4Fun.CardValue(1)) # p2
    push!(stack, Just4Fun.CardValue(2)) # p1
    push!(stack, Just4Fun.CardValue(1)) # p2
    push!(stack, Just4Fun.CardValue(2)) # p1
    push!(stack, Just4Fun.CardValue(1)) # p2
    push!(stack, Just4Fun.CardValue(2)) # p1
    push!(stack, Just4Fun.CardValue(1)) # p2
    push!(stack, Just4Fun.CardValue(2)) # p1
    spec = Just4Fun.Just4FunSpec(stack)
    game = GI.init(spec)
    @test game.curplayer == Just4Fun.Player(Just4Fun.YELLOW)
    @test Just4Fun.curplayercards(game) == Just4Fun.Cards([
      Just4Fun.CardValue(2), Just4Fun.CardValue(2),
      Just4Fun.CardValue(2), Just4Fun.CardValue(2)
    ])
  end
else
  @warn "Skipping test for FEATURE CARDS as it is disabled!"
end

##########
if Just4Fun.FEATURE_CARDS
  @testset "playercards" begin
    stack = Stack{Just4Fun.CardValue}()
    push!(stack, Just4Fun.CardValue(1)) # p2
    push!(stack, Just4Fun.CardValue(2)) # p1
    push!(stack, Just4Fun.CardValue(1)) # p2
    push!(stack, Just4Fun.CardValue(2)) # p1
    push!(stack, Just4Fun.CardValue(1)) # p2
    push!(stack, Just4Fun.CardValue(2)) # p1
    push!(stack, Just4Fun.CardValue(1)) # p2
    push!(stack, Just4Fun.CardValue(2)) # p1
    spec = Just4Fun.Just4FunSpec(stack)
    game = GI.init(spec)
    
    @test Just4Fun.playercards(
      game,
      Just4Fun.Player(Just4Fun.YELLOW)
    ) == Just4Fun.Cards([
      Just4Fun.CardValue(2), Just4Fun.CardValue(2),
      Just4Fun.CardValue(2), Just4Fun.CardValue(2)
    ])
    @test Just4Fun.playercards(
      game,
      Just4Fun.Player(Just4Fun.RED)
    ) == Just4Fun.Cards([
      Just4Fun.CardValue(1), Just4Fun.CardValue(1),
      Just4Fun.CardValue(1), Just4Fun.CardValue(1)
    ])
  end
else
  @warn "Skipping test for FEATURE CARDS as it is disabled!"
end
##########

@testset "valid_pos" begin
  if Just4Fun.SIDE_LENGTH == 4
    @testset "4x4" begin
      fields = SMatrix{4, 4, FieldValue, 16}([
        1  2  3  4 ;
        5  6  7  8 ;
        9 10 11 12 ;
        13 14 15 16 ])
      
      @test Just4Fun.valid_pos(fields, (1, 1)) == true
      @test Just4Fun.valid_pos(fields, (1, 2)) == true
      @test Just4Fun.valid_pos(fields, (1, 3)) == true
      @test Just4Fun.valid_pos(fields, (1, 4)) == true
      @test Just4Fun.valid_pos(fields, (2, 1)) == true
      @test Just4Fun.valid_pos(fields, (2, 2)) == true
      @test Just4Fun.valid_pos(fields, (2, 3)) == true
      @test Just4Fun.valid_pos(fields, (2, 4)) == true
      @test Just4Fun.valid_pos(fields, (3, 1)) == true
      @test Just4Fun.valid_pos(fields, (3, 2)) == true
      @test Just4Fun.valid_pos(fields, (3, 3)) == true
      @test Just4Fun.valid_pos(fields, (3, 4)) == true
      @test Just4Fun.valid_pos(fields, (4, 1)) == true
      @test Just4Fun.valid_pos(fields, (4, 2)) == true
      @test Just4Fun.valid_pos(fields, (4, 3)) == true
      @test Just4Fun.valid_pos(fields, (4, 4)) == true

      @test Just4Fun.valid_pos(fields, (0, 0)) == false
      @test Just4Fun.valid_pos(fields, (0, 1)) == false
      @test Just4Fun.valid_pos(fields, (0, 2)) == false
      @test Just4Fun.valid_pos(fields, (0, 3)) == false
      @test Just4Fun.valid_pos(fields, (0, 4)) == false
      
      @test Just4Fun.valid_pos(fields, (0, 0)) == false
      @test Just4Fun.valid_pos(fields, (1, 0)) == false
      @test Just4Fun.valid_pos(fields, (2, 0)) == false
      @test Just4Fun.valid_pos(fields, (3, 0)) == false
      @test Just4Fun.valid_pos(fields, (4, 0)) == false
      @test Just4Fun.valid_pos(fields, (5, 0)) == false

      @test Just4Fun.valid_pos(fields, (5, 1)) == false
      @test Just4Fun.valid_pos(fields, (5, 2)) == false
      @test Just4Fun.valid_pos(fields, (5, 3)) == false
      @test Just4Fun.valid_pos(fields, (5, 4)) == false
      @test Just4Fun.valid_pos(fields, (5, 5)) == false
      
      @test Just4Fun.valid_pos(fields, (1, 5)) == false
      @test Just4Fun.valid_pos(fields, (2, 5)) == false
      @test Just4Fun.valid_pos(fields, (3, 5)) == false
      @test Just4Fun.valid_pos(fields, (4, 5)) == false
      #@test valid_pos(fields, (5, 5)) == false
    end
  else
    @warn "Skipping test for 4x4 board!"
  end
  
  if Just4Fun.SIDE_LENGTH == 6
    @testset "6x6 (original)" begin

      fields = SMatrix{6, 6, FieldValue, 36}([
      1 14 30 24 19  8 ;
      33 11  9 16 35 21 ;
      6 27 31 20  3 12 ;
      15 32  5 29 17 26 ;
      22 10 18 36 25  2 ;
      28  7 23  4 13 34 ])

      @test Just4Fun.valid_pos(fields, (1, 1)) == true
      @test Just4Fun.valid_pos(fields, (1, 2)) == true
      @test Just4Fun.valid_pos(fields, (1, 3)) == true
      @test Just4Fun.valid_pos(fields, (1, 4)) == true
      @test Just4Fun.valid_pos(fields, (1, 5)) == true
      @test Just4Fun.valid_pos(fields, (1, 6)) == true
      @test Just4Fun.valid_pos(fields, (2, 1)) == true
      @test Just4Fun.valid_pos(fields, (2, 2)) == true
      @test Just4Fun.valid_pos(fields, (2, 3)) == true
      @test Just4Fun.valid_pos(fields, (2, 4)) == true
      @test Just4Fun.valid_pos(fields, (2, 5)) == true
      @test Just4Fun.valid_pos(fields, (2, 6)) == true
      @test Just4Fun.valid_pos(fields, (3, 1)) == true
      @test Just4Fun.valid_pos(fields, (3, 2)) == true
      @test Just4Fun.valid_pos(fields, (3, 3)) == true
      @test Just4Fun.valid_pos(fields, (3, 4)) == true
      @test Just4Fun.valid_pos(fields, (3, 5)) == true
      @test Just4Fun.valid_pos(fields, (3, 6)) == true
      @test Just4Fun.valid_pos(fields, (4, 1)) == true
      @test Just4Fun.valid_pos(fields, (4, 2)) == true
      @test Just4Fun.valid_pos(fields, (4, 3)) == true
      @test Just4Fun.valid_pos(fields, (4, 4)) == true  
      @test Just4Fun.valid_pos(fields, (4, 5)) == true
      @test Just4Fun.valid_pos(fields, (4, 6)) == true
      @test Just4Fun.valid_pos(fields, (5, 1)) == true
      @test Just4Fun.valid_pos(fields, (5, 2)) == true
      @test Just4Fun.valid_pos(fields, (5, 3)) == true
      @test Just4Fun.valid_pos(fields, (5, 4)) == true  
      @test Just4Fun.valid_pos(fields, (5, 5)) == true
      @test Just4Fun.valid_pos(fields, (5, 6)) == true
      @test Just4Fun.valid_pos(fields, (6, 1)) == true
      @test Just4Fun.valid_pos(fields, (6, 2)) == true
      @test Just4Fun.valid_pos(fields, (6, 3)) == true
      @test Just4Fun.valid_pos(fields, (6, 4)) == true  
      @test Just4Fun.valid_pos(fields, (6, 5)) == true
      @test Just4Fun.valid_pos(fields, (6, 6)) == true

      @test Just4Fun.valid_pos(fields, (0, 0)) == false
      @test Just4Fun.valid_pos(fields, (0, 1)) == false
      @test Just4Fun.valid_pos(fields, (0, 2)) == false
      @test Just4Fun.valid_pos(fields, (0, 3)) == false
      @test Just4Fun.valid_pos(fields, (0, 4)) == false
      @test Just4Fun.valid_pos(fields, (0, 5)) == false
      @test Just4Fun.valid_pos(fields, (0, 6)) == false
      
      @test Just4Fun.valid_pos(fields, (0, 0)) == false
      @test Just4Fun.valid_pos(fields, (1, 0)) == false
      @test Just4Fun.valid_pos(fields, (2, 0)) == false
      @test Just4Fun.valid_pos(fields, (3, 0)) == false
      @test Just4Fun.valid_pos(fields, (4, 0)) == false
      @test Just4Fun.valid_pos(fields, (5, 0)) == false
      @test Just4Fun.valid_pos(fields, (6, 0)) == false
      @test Just4Fun.valid_pos(fields, (7, 0)) == false

      @test Just4Fun.valid_pos(fields, (7, 1)) == false
      @test Just4Fun.valid_pos(fields, (7, 2)) == false
      @test Just4Fun.valid_pos(fields, (7, 3)) == false
      @test Just4Fun.valid_pos(fields, (7, 4)) == false
      @test Just4Fun.valid_pos(fields, (7, 5)) == false
      @test Just4Fun.valid_pos(fields, (7, 6)) == false
      @test Just4Fun.valid_pos(fields, (7, 7)) == false
      
      @test Just4Fun.valid_pos(fields, (1, 7)) == false
      @test Just4Fun.valid_pos(fields, (2, 7)) == false
      @test Just4Fun.valid_pos(fields, (3, 7)) == false
      @test Just4Fun.valid_pos(fields, (4, 7)) == false
      @test Just4Fun.valid_pos(fields, (5, 7)) == false
      @test Just4Fun.valid_pos(fields, (6, 7)) == false
      #@test valid_pos(fields, (7, 7)) == false
    end
  else
    @warn "Skipping test for 6x6 board!"
  end
end

##########

@testset "num_connected_dir" begin
  if Just4Fun.SIDE_LENGTH == 4
    @testset "4x4" begin
      field_values = SMatrix{4, 4, FieldValue, 16}([
        1  2  3  4 ;
        5  6  7  8 ;
        9 10 11 12 ;
        13 14 15 16 ])
      
      field_stones = SArray{Tuple{4, 4, 2}, Stones}([
        # p1
        0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00;;;
        # p2
        0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00
      ])
      
      # TODO: might be wrong since we put stone on 1 should increment by 1 and thus return 1
      for dir in [(1,1), (0,1), (1,0), (1,-1)], player in [Just4Fun.YELLOW, Just4Fun.RED]
        @test Just4Fun.num_connected_dir(field_values, field_stones, player, FieldValue(1), dir) == 0
      end

      field_stones = SArray{Tuple{4, 4, 2}, Stones}([
        # p1
        0x00 0x00 0x00 0x00;
        0x00 0x01 0x00 0x00;
        0x00 0x00 0x01 0x00;
        0x00 0x00 0x00 0x01;;;
        # p2
        0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00
      ])
      @test Just4Fun.num_connected_dir(
        field_values, field_stones,
        Just4Fun.YELLOW, FieldValue(1), (1,1)) == 3
      @test Just4Fun.num_connected_dir(
        field_values, field_stones,
        Just4Fun.YELLOW, FieldValue(1), (1,0)) == 0
      @test Just4Fun.num_connected_dir(
        field_values, field_stones,
        Just4Fun.YELLOW, FieldValue(1), (0,1)) == 0
      @test Just4Fun.num_connected_dir(
        field_values, field_stones,
        Just4Fun.YELLOW, FieldValue(1), (1,-1)) == 0

      @test Just4Fun.num_connected_dir(
        field_values, field_stones,
        Just4Fun.RED, FieldValue(1), (1,1)) == 0
      @test Just4Fun.num_connected_dir(
        field_values, field_stones,
        Just4Fun.RED, FieldValue(1), (1,0)) == 0
      @test Just4Fun.num_connected_dir(
        field_values, field_stones,
        Just4Fun.RED, FieldValue(1), (0,1)) == 0
      @test Just4Fun.num_connected_dir(
        field_values, field_stones,
        Just4Fun.RED, FieldValue(1), (1,-1)) == 0


      field_stones = SArray{Tuple{4, 4, 2}, Stones}([
        # p1
        0x01 0x01 0x01 0x01;
        0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00;;;
        # p2
        0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00
      ])
      @test Just4Fun.num_connected_dir(
        field_values, field_stones,
        Just4Fun.YELLOW, FieldValue(1), (1,1)) == 0
      @test Just4Fun.num_connected_dir(
        field_values, field_stones,
        Just4Fun.YELLOW, FieldValue(1), (1,0)) == 0
      @test Just4Fun.num_connected_dir(
        field_values, field_stones,
        Just4Fun.YELLOW, FieldValue(1), (0,1)) == 3
      @test Just4Fun.num_connected_dir(
        field_values, field_stones,
        Just4Fun.YELLOW, FieldValue(1), (1,-1)) == 0

      field_stones = SArray{Tuple{4, 4, 2}, Stones}([
        # p1
        0x01 0x00 0x01 0x00;
        0x01 0x00 0x00 0x00;
        0x01 0x00 0x00 0x00;
        0x01 0x00 0x00 0x00;;;
        # p2
        0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00
      ])
      @test Just4Fun.num_connected_dir(
        field_values, field_stones,
        Just4Fun.YELLOW, FieldValue(1), (1,1)) == 0
      @test Just4Fun.num_connected_dir(
        field_values, field_stones,
        Just4Fun.YELLOW, FieldValue(1), (1,0)) == 3
      @test Just4Fun.num_connected_dir(
        field_values, field_stones,
        Just4Fun.YELLOW, FieldValue(1), (0,1)) == 0
      @test Just4Fun.num_connected_dir(
        field_values, field_stones,
        Just4Fun.YELLOW, FieldValue(1), (1,-1)) == 0

      field_stones = SArray{Tuple{4, 4, 2}, Stones}([
        # p1
        0x00 0x00 0x01 0x00;
        0x01 0x00 0x01 0x00;
        0x01 0x01 0x00 0x00;
        0x00 0x00 0x00 0x00;;;
        # p2
        0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00
      ])
      @test Just4Fun.num_connected_dir(
        field_values, field_stones,
        Just4Fun.YELLOW, FieldValue(4), (1,1)) == 0
      @test Just4Fun.num_connected_dir(
        field_values, field_stones,
        Just4Fun.YELLOW, FieldValue(4), (1,0)) == 0
      @test Just4Fun.num_connected_dir(
        field_values, field_stones,
        Just4Fun.YELLOW, FieldValue(4), (0,1)) == 0
      @test Just4Fun.num_connected_dir(
        field_values, field_stones,
        Just4Fun.YELLOW, FieldValue(4), (1,-1)) == 2
    end
  else
    @warn "Skipping test for 4x4 board!"
  end

  if Just4Fun.SIDE_LENGTH == 6
    @testset "6x6" begin
      field_values = SMatrix{6, 6, FieldValue, 36}([
        1  2  3  4  5  6;
        7  8  9 10 11 12;
        13 14 15 16 17 18;
        19 20 21 22 23 24;
        25 26 27 28 29 30;
        31 32 33 34 35 36
      ])
      
      field_stones = SArray{Tuple{6, 6, 2}, Stones}([
        # p1
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;;;
        # p2
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00
      ])
      
      # TODO: might be wrong since we put stone on 1 should increment by 1 and thus return 1
      for dir in [(1,1), (0,1), (1,0), (1,-1)], player in [Just4Fun.YELLOW, Just4Fun.RED]
        @test Just4Fun.num_connected_dir(field_values, field_stones, player, FieldValue(1), dir) == 0
      end
      field_stones = SArray{Tuple{6, 6, 2}, Stones}([
        # p1
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x01 0x00 0x00 0x00 0x00;
        0x00 0x00 0x01 0x00 0x00 0x00;
        0x00 0x00 0x00 0x01 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;;;
        # p2
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00
      ])
      @test Just4Fun.num_connected_dir(
        field_values, field_stones,
        Just4Fun.YELLOW, FieldValue(1), (1,1)) == 3 # 4 might be correct
      @test Just4Fun.num_connected_dir(
        field_values, field_stones,
        Just4Fun.YELLOW, FieldValue(1), (1,0)) == 0
      @test Just4Fun.num_connected_dir(
        field_values, field_stones,
        Just4Fun.YELLOW, FieldValue(1), (0,1)) == 0
      @test Just4Fun.num_connected_dir(
        field_values, field_stones,
        Just4Fun.YELLOW, FieldValue(1), (1,-1)) == 0
    end
  else
    @warn "Skipping test for 6x6 board!"
  end
end

##########

@testset "num_connected_axis" begin

  if Just4Fun.SIDE_LENGTH == 4
    @testset "4x4" begin
      field_values = SMatrix{4, 4, FieldValue, 16}([
        1  2  3  4 ;
        5  6  7  8 ;
        9 10 11 12 ;
        13 14 15 16 ])
      
      field_stones = SArray{Tuple{4, 4, 2}, Stones}([
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
      ])
      
      # p1 - on 4 - count majority on sec maj axis
      @test Just4Fun.num_connected_axis(
        field_values, field_stones, Just4Fun.YELLOW, FieldValue(4), (1,-1)
      ) == 3
      # p1 - on 4 - count majority on last col
      @test Just4Fun.num_connected_axis(
        field_values, field_stones, Just4Fun.YELLOW, FieldValue(4), (1,0)
      ) == 2
      # p1 - on 4 - count majority on last col - 2 is prevented by p2 !!!!!
      @test Just4Fun.num_connected_axis(
        field_values, field_stones, Just4Fun.YELLOW, FieldValue(4), (0,-1)
      ) == 1
      
      # p1 - on 7 - prim axis - before blocked by p1
      @test Just4Fun.num_connected_axis(
        field_values, field_stones, Just4Fun.YELLOW, FieldValue(7), (1,1)
      ) == 1
      # p1 - on 7 - sec axis - 2 before 1 after and one on 7
      @test Just4Fun.num_connected_axis(
        field_values, field_stones, Just4Fun.YELLOW, FieldValue(7), (1,-1)
      ) == 3
      # p1 - on 7 - vert - only below and on 7
      @test Just4Fun.num_connected_axis(
        field_values, field_stones, Just4Fun.YELLOW, FieldValue(7), (1,0)
      ) == 1
      # p1 - on 7 - horiz
      @test Just4Fun.num_connected_axis(
        field_values, field_stones, Just4Fun.YELLOW, FieldValue(7), (0,1)
      ) == 2
    end
  else
    @warn "Skipping test for 4x4 board!"
  end
  if Just4Fun.SIDE_LENGTH == 6
    @testset "6x6" begin
      field_values = SMatrix{6, 6, FieldValue, 36}([
        1  2  3  4  5  6;
        7  8  9 10 11 12;
        13 14 15 16 17 18;
        19 20 21 22 23 24;
        25 26 27 28 29 30;
        31 32 33 34 35 36
      ])
      
      field_stones = SArray{Tuple{6, 6, 2}, Stones}([
        # p1
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x01 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;;;
        # p2
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x01 0x00;
        0x00 0x00 0x00 0x01 0x01 0x00;
        0x00 0x00 0x01 0x01 0x00 0x00;
        0x00 0x01 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00
      ])
      
      # p1 - on 26 - count majority on sec maj axis - prevented by p2
      @test Just4Fun.num_connected_axis(
        field_values, field_stones, Just4Fun.YELLOW, FieldValue(26), (1,-1)
      ) == 0
      # p2 - on 26 - count majority on sec maj axis - 4th prevented by p1
      @test Just4Fun.num_connected_axis(
        field_values, field_stones, Just4Fun.RED, FieldValue(26), (1,-1)
      ) == 3

      # p2 - on 21 - prim axis - nothing except for at 21
      @test Just4Fun.num_connected_axis(
        field_values, field_stones, Just4Fun.RED, FieldValue(21), (1,1)
      ) == 0
      # p2 - on 21 - sec axis - before is blocked by p1
      @test Just4Fun.num_connected_axis(
        field_values, field_stones, Just4Fun.RED, FieldValue(21), (1,-1)
      ) == 2
      # p2 - on 21 - vert
      @test Just4Fun.num_connected_axis(
        field_values, field_stones, Just4Fun.RED, FieldValue(21), (1,0)
      ) == 0
      # p2 - on 21 - horiz - not blocked by p1
      @test Just4Fun.num_connected_axis(
        field_values, field_stones, Just4Fun.RED, FieldValue(21), (0,1)
      ) == 1
    end
  else
    @warn "Skipping test for 6x6 board!"
  end
end

##########

@testset "num_connected_axis" begin
  if Just4Fun.SIDE_LENGTH == 4
    @testset "4x4" begin
      spec = Just4FunSpec()

      field_values = SMatrix{4, 4, FieldValue, 16}([
        1  2  3  4 ;
        5  6  7  8 ;
        9 10 11 12 ;
        13 14 15 16 ])
      
      field_stones = SArray{Tuple{4, 4, 2}, Stones}([
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
      ])
      
      # p1 - on 4 - sec maj axis
      @test Just4Fun.winning_pattern_at(
        spec, field_values, field_stones, Just4Fun.YELLOW, FieldValue(4)
      ) == true
      @test Just4Fun.winning_pattern_at(
        spec, field_values, field_stones, Just4Fun.YELLOW, FieldValue(6)
      ) == false
    end
  else
    @warn "Skipping test for 4x4 board!"
  end

  if Just4Fun.SIDE_LENGTH == 6
    @testset "6x6" begin
      spec = Just4FunSpec()
      field_values = SMatrix{6, 6, FieldValue, 36}([
        1  2  3  4  5  6;
        7  8  9 10 11 12;
        13 14 15 16 17 18;
        19 20 21 22 23 24;
        25 26 27 28 29 30;
        31 32 33 34 35 36
      ])
      
      field_stones = SArray{Tuple{6, 6, 2}, Stones}([
        # p1
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x01 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;;;
        # p2
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x01 0x00;
        0x00 0x00 0x00 0x01 0x01 0x00;
        0x00 0x00 0x01 0x01 0x00 0x00;
        0x00 0x01 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00
      ])
      
      # p1 - on 11 - none
      @test Just4Fun.winning_pattern_at(
        spec, field_values, field_stones, Just4Fun.YELLOW, FieldValue(11)
      ) == false

      # p2 - on 11 - prevented by p1
      @test Just4Fun.winning_pattern_at(
        spec, field_values, field_stones, Just4Fun.RED, FieldValue(11)
      ) == false
      # p2 - on 16 - prevented by p1
      @test Just4Fun.winning_pattern_at(
        spec, field_values, field_stones, Just4Fun.RED, FieldValue(16)
      ) == false
      # p2 - on 21 - prevented by p1
      @test Just4Fun.winning_pattern_at(
        spec, field_values, field_stones, Just4Fun.RED, FieldValue(21)
      ) == false

      field_stones = SArray{Tuple{6, 6, 2}, Stones}([
        # p1
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x01 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;;;
        # p2
        0x00 0x00 0x00 0x00 0x00 0x01;
        0x00 0x00 0x00 0x00 0x01 0x00;
        0x00 0x00 0x00 0x01 0x01 0x00;
        0x00 0x00 0x01 0x01 0x00 0x00;
        0x00 0x01 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00
      ])
      
      # p2 - on 6 - sec maj axis
      @test Just4Fun.winning_pattern_at(
        spec, field_values, field_stones, Just4Fun.RED, FieldValue(6)
      ) == true
      # p2 - on 11 - sec maj axis
      @test Just4Fun.winning_pattern_at(
        spec, field_values, field_stones, Just4Fun.RED, FieldValue(11)
      ) == true
      # p2 - on 16 - sec maj axis
      @test Just4Fun.winning_pattern_at(
        spec, field_values, field_stones, Just4Fun.RED, FieldValue(16)
      ) == true
      # p2 - on 21 - sec maj axis
      @test Just4Fun.winning_pattern_at(
        spec, field_values, field_stones, Just4Fun.RED, FieldValue(21)
      ) == true

      # p1 - none
      @test Just4Fun.winning_pattern_at(
        spec, field_values, field_stones, Just4Fun.YELLOW, FieldValue(6)
      ) == false
      # p1 - none
      @test Just4Fun.winning_pattern_at(
        spec, field_values, field_stones, Just4Fun.YELLOW, FieldValue(11)
      ) == false
      # p1 - none
      @test Just4Fun.winning_pattern_at(
        spec, field_values, field_stones, Just4Fun.YELLOW, FieldValue(16)
      ) == false
      # p1 - none
      @test Just4Fun.winning_pattern_at(
        spec, field_values, field_stones, Just4Fun.YELLOW, FieldValue(21)
      ) == false
      # p1 - none
      @test Just4Fun.winning_pattern_at(spec, field_values, field_stones, Just4Fun.YELLOW, FieldValue(26)
      ) == false
    end
  else
    @warn "Skipping test for 6x6 board!"
  end
end

##########

@testset "update_actions_mask!" begin
  if Just4Fun.FEATURE_CARDS
    @testset "opponent dominated fields not available in action mask (FEATURE_CARDS=true)" begin
      stack = Stack{Just4Fun.CardValue}()
      push!(stack, CardValue(1)) # p2
      push!(stack, CardValue(2)) # p1
      push!(stack, CardValue(1)) # p2
      push!(stack, CardValue(2)) # p1
      push!(stack, CardValue(1)) # p2
      push!(stack, CardValue(2)) # p1
      push!(stack, CardValue(1)) # p2
      push!(stack, CardValue(2)) # p1
      spec = Just4FunSpec(stack)
      game = GI.init(spec)

      actions = GI.actions(spec)
      
      # preconditions
      @test sum(game.field_stones) == 0
      
      game.curplayer = Player(Just4Fun.YELLOW)
      mask_yellow = GI.actions_mask(game)
      cards_yellow = Just4Fun.playercards(game, game.curplayer)
      regular_combs = Just4Fun.regular_combinations(Just4Fun.FIELD_VALUES, cards_yellow)
      
      game.curplayer = Player(Just4Fun.RED)
      mask_red = GI.actions_mask(game)
      cards_red = Just4Fun.playercards(game, game.curplayer)
      regular_combs_red = Just4Fun.regular_combinations(Just4Fun.FIELD_VALUES, cards_red)

      for (action_card_comb, value) in actions

        mask_index = Just4Fun.ACTION_ACTION_MASK_INDEX_MAP[(cards=action_card_comb, value=value)]
        
        # p1 combination: [2], [2 2], [2 2 2], [2 2 2 2]
        game.curplayer = Just4Fun.YELLOW
        if action_card_comb in regular_combs
          @test GI.actions_mask(game)[mask_index] == true
        else
          @test GI.actions_mask(game)[mask_index] == false
        end

        # p2 combination: [1], [1 1], [1 1 1], [1 1 1 1]
        game.curplayer = Player(Just4Fun.RED)
        if action_card_comb in regular_combs_red
          @test GI.actions_mask(game)[mask_index] == true
        else
          @test GI.actions_mask(game)[mask_index] == false
        end
      end
      
      @test GI.actions_mask(game)[Just4Fun.ACTION_ACTION_MASK_INDEX_MAP[(cards=[0x1], value=0x1)]] == true
      
      # block YELLOW / p1 on field 1 by stone of RED
      game.curplayer = Just4Fun.RED
      Just4Fun.place_stone!(game, 0x1)
      Just4Fun.place_stone!(game, 0x1)
      Just4Fun.update_action_mask!(game)

      game.curplayer = Just4Fun.YELLOW
      @test GI.actions_mask(game)[Just4Fun.ACTION_ACTION_MASK_INDEX_MAP[(cards=[0x1], value=0x1)]] == 0x0 # false
    end
  else
    @testset "opponent dominated fields not available in action mask (FEATURE_CARDS=false)" begin
      spec = Just4FunSpec()
      game = GI.init(spec)

      actions = GI.actions(spec)
      
      # preconditions
      @test sum(game.field_stones) == 0
      
      game.curplayer = Player(Just4Fun.YELLOW)
      mask_yellow = GI.actions_mask(game)
      
      game.curplayer = Player(Just4Fun.RED)
      mask_red = GI.actions_mask(game)
      
      # initially both players can place on every field
      for value in actions
        mask_index = Just4Fun.ACTION_ACTION_MASK_INDEX_MAP[value]

        game.curplayer = Just4Fun.YELLOW
        @test GI.actions_mask(game)[mask_index] == true
        
        game.curplayer = Player(Just4Fun.RED)
        @test GI.actions_mask(game)[mask_index] == true
      end
      
      # block YELLOW / p1 on field 1 by stone of RED
      game.curplayer = Just4Fun.RED
      Just4Fun.place_stone!(game, 0x1)
      Just4Fun.place_stone!(game, 0x1)
      Just4Fun.update_action_mask!(game)

      game.curplayer = Just4Fun.YELLOW
      @test GI.actions_mask(game)[Just4Fun.ACTION_ACTION_MASK_INDEX_MAP[0x1]] == false
    end
  end

  if Just4Fun.FEATURE_CARDS
    @testset "self dominated fields not available in action mask (FEATURE_CARDS=true)" begin
      stack = Stack{Just4Fun.CardValue}()
      push!(stack, CardValue(1)) # p2
      push!(stack, CardValue(2)) # p1
      push!(stack, CardValue(1)) # p2
      push!(stack, CardValue(2)) # p1
      push!(stack, CardValue(1)) # p2
      push!(stack, CardValue(2)) # p1
      push!(stack, CardValue(1)) # p2
      push!(stack, CardValue(2)) # p1
      spec = Just4FunSpec(stack)
      game = GI.init(spec)

      actions = GI.actions(spec)
      
      # preconditions
      @test sum(game.field_stones) == 0
      
      game.curplayer = Player(Just4Fun.YELLOW)
      mask_yellow = GI.actions_mask(game)
      cards_yellow = Just4Fun.playercards(game, game.curplayer)
      regular_combs = Just4Fun.regular_combinations(Just4Fun.FIELD_VALUES, cards_yellow)
      
      game.curplayer = Player(Just4Fun.RED)
      mask_red = GI.actions_mask(game)
      cards_red = Just4Fun.playercards(game, game.curplayer)
      regular_combs_red = Just4Fun.regular_combinations(Just4Fun.FIELD_VALUES, cards_red)

      for (action_card_comb, value) in actions

        mask_index = Just4Fun.ACTION_ACTION_MASK_INDEX_MAP[(cards=action_card_comb, value=value)]
        
        # p1 combination: [2], [2 2], [2 2 2], [2 2 2 2]
        game.curplayer = Just4Fun.YELLOW
        if action_card_comb in regular_combs
          @test GI.actions_mask(game)[mask_index] == true
        else
          @test GI.actions_mask(game)[mask_index] == false
        end

        # p2 combination: [1], [1 1], [1 1 1], [1 1 1 1]
        game.curplayer = Player(Just4Fun.RED)
        if action_card_comb in regular_combs_red
          @test GI.actions_mask(game)[mask_index] == true
        else
          @test GI.actions_mask(game)[mask_index] == false
        end
      end
      
      @test GI.actions_mask(game)[Just4Fun.ACTION_ACTION_MASK_INDEX_MAP[(cards=[0x1], value=0x1)]] == true
      
      # block YELLOW / p1 on field 1 by stone of itself
      game.curplayer = Just4Fun.YELLOW
      Just4Fun.place_stone!(game, 0x1)
      Just4Fun.place_stone!(game, 0x1)
      Just4Fun.update_action_mask!(game)

      game.curplayer = Just4Fun.YELLOW
      @test GI.actions_mask(game)[Just4Fun.ACTION_ACTION_MASK_INDEX_MAP[(cards=[0x1], value=0x1)]] == 0x0 # false
    end
  else
    @testset "self dominated fields not available in action mask (FEATURE_CARDS=false)" begin
      spec = Just4FunSpec()
      game = GI.init(spec)
  
      actions = GI.actions(spec)
      
      # preconditions
      @test sum(game.field_stones) == 0
      
      game.curplayer = Player(Just4Fun.YELLOW)
      mask_yellow = GI.actions_mask(game)
      
      game.curplayer = Player(Just4Fun.RED)
      mask_red = GI.actions_mask(game)
      
      # initially both players can place on every field
      for value in actions
        mask_index = Just4Fun.ACTION_ACTION_MASK_INDEX_MAP[value]
        
        game.curplayer = Just4Fun.YELLOW
        @test GI.actions_mask(game)[mask_index] == true
        
        game.curplayer = Player(Just4Fun.RED)
        @test GI.actions_mask(game)[mask_index] == true
      end
      
      # block YELLOW / p1 on field 1 by stone of itself
      game.curplayer = Just4Fun.YELLOW
      Just4Fun.place_stone!(game, 0x1)
      Just4Fun.place_stone!(game, 0x1)
      Just4Fun.update_action_mask!(game)
  
      game.curplayer = Just4Fun.YELLOW
      @test GI.actions_mask(game)[Just4Fun.ACTION_ACTION_MASK_INDEX_MAP[0x1]] == false
    end
  end
end

##########

@testset "update_status!" begin
  @testset "after action (win) 1" begin
    game = GI.init(Just4FunSpec())

    @test game.winner == Player(0)
    @test game.state == in_progress

    #make player yellow win
    #  1 14 30 24 19  8 ;
    # 33 11  9 16 35 21 ;
    #  6 27 31 20  3 12 ;
    # 15 32  5 29 17 26 ;
    # 22 10 18 36 25  2 ;
    # 28  7 23  4 13 34
    game.curplayer = Just4Fun.RED
    Just4Fun.place_stone!(game, FieldValue(1))
    game.curplayer = Just4Fun.YELLOW
    Just4Fun.place_stone!(game, FieldValue(1))
    Just4Fun.place_stone!(game, FieldValue(1))
    Just4Fun.place_stone!(game, FieldValue(11))
    Just4Fun.place_stone!(game, FieldValue(31))
    Just4Fun.place_stone!(game, FieldValue(29))
    
    Just4Fun.update_status!(game, (cards=CardValue[], value=FieldValue(29)))

    @test game.winner == Player(Just4Fun.YELLOW)
    @test game.state == end_by_pattern
  end

  @testset "after action (win) 2" begin
    game = GI.init(Just4FunSpec())

    @test game.winner == Player(0)
    @test game.state == in_progress

    #make player yellow win
    #  1 14 30 24 19  8 ;
    # 33 11  9 16 35 21 ;
    #  6 27 31 20  3 12 ;
    # 15 32  5 29 17 26 ;
    # 22 10 18 36 25  2 ;
    # 28  7 23  4 13 34
    game.curplayer = Just4Fun.RED
    Just4Fun.place_stone!(game, FieldValue(1))
    game.curplayer = Just4Fun.YELLOW
    Just4Fun.place_stone!(game, FieldValue(1))
    Just4Fun.place_stone!(game, FieldValue(11))
    Just4Fun.place_stone!(game, FieldValue(31))
    Just4Fun.place_stone!(game, FieldValue(29))
    
    Just4Fun.update_status!(game, (cards=CardValue[], value=FieldValue(29)))

    @test game.winner == Player(0)
    @test game.state == in_progress

    Just4Fun.place_stone!(game, FieldValue(1))

    Just4Fun.update_status!(game, (cards=CardValue[], value=FieldValue(1)))

    @test game.winner == Player(Just4Fun.YELLOW)
    @test game.state == end_by_pattern
  end

  @testset "after action (no win) 3" begin
    game = GI.init(Just4FunSpec())

    @test game.winner == Player(0)
    @test game.state == in_progress

    #make player yellow win
    #  1 14 30 24 19  8 ;
    # 33 11  9 16 35 21 ;
    #  6 27 31 20  3 12 ;
    # 15 32  5 29 17 26 ;
    # 22 10 18 36 25  2 ;
    # 28  7 23  4 13 34
    game.curplayer = Just4Fun.RED
    Just4Fun.place_stone!(game, FieldValue(1))
    game.curplayer = Just4Fun.YELLOW
    Just4Fun.place_stone!(game, FieldValue(1))
    Just4Fun.place_stone!(game, FieldValue(1))
    Just4Fun.place_stone!(game, FieldValue(11))
    #place_stone!(game, FieldValue(31)) 31 missing
    Just4Fun.place_stone!(game, FieldValue(29))
    
    Just4Fun.update_status!(game, (cards=CardValue[], value=FieldValue(31)))

    @test game.winner == Player(0)
    @test game.state == in_progress
  end

  @testset "after action (redraw) 4" begin
    game = GI.init(Just4FunSpec())

    @test game.winner == Player(0)
    @test game.state == in_progress

    #make player yellow win
    #  1 14 30 24 19  8 ;
    # 33 11  9 16 35 21 ;
    #  6 27 31 20  3 12 ;
    # 15 32  5 29 17 26 ;
    # 22 10 18 36 25  2 ;
    # 28  7 23  4 13 34
    game.curplayer = Just4Fun.RED
    Just4Fun.place_stone!(game, FieldValue(1))
    game.curplayer = Just4Fun.YELLOW
    Just4Fun.place_stone!(game, FieldValue(1))
    Just4Fun.place_stone!(game, FieldValue(1))
    Just4Fun.place_stone!(game, FieldValue(11))
    Just4Fun.place_stone!(game, FieldValue(31))
    Just4Fun.place_stone!(game, FieldValue(29))
    # artificial win for YELLOW

    # forcing an update after redraw, which is not supposed to check the winning conditions
    Just4Fun.update_status!(game, (cards=CardValue[], value=FieldValue(0)))

    # winner is still not set and game still not finished
    @test game.winner == Player(0)
    @test game.state == in_progress
  end

  @testset "action-independent (majority)" begin
    game = GI.init(Just4FunSpec())

    @test game.winner == 0x0
    @test game.state == in_progress

    #make player yellow win
    #  1 14 30 24 19  8 ;
    # 33 11  9 16 35 21 ;
    #  6 27 31 20  3 12 ;
    # 15 32  5 29 17 26 ;
    # 22 10 18 36 25  2 ;
    # 28  7 23  4 13 34
    game.curplayer = Just4Fun.RED
    Just4Fun.place_stone!(game, FieldValue(1))
    game.curplayer = Just4Fun.YELLOW
    Just4Fun.place_stone!(game, FieldValue(1))
    Just4Fun.place_stone!(game, FieldValue(1))
    Just4Fun.place_stone!(game, FieldValue(11))
    Just4Fun.place_stone!(game, FieldValue(31))
    Just4Fun.place_stone!(game, FieldValue(29))
    
    Just4Fun.update_status!(game)

    @test game.winner == Just4Fun.YELLOW
    @test game.state == end_by_pattern
  end

  @testset "action-independent (no majority) 1" begin
    game = GI.init(Just4FunSpec())

    @test game.winner == 0x0
    @test game.state == in_progress

    #make player yellow win
    #  1 14 30 24 19  8 ;
    # 33 11  9 16 35 21 ;
    #  6 27 31 20  3 12 ;
    # 15 32  5 29 17 26 ;
    # 22 10 18 36 25  2 ;
    # 28  7 23  4 13 34
    game.curplayer = Just4Fun.RED
    Just4Fun.place_stone!(game, FieldValue(1))
    game.curplayer = Just4Fun.YELLOW
    Just4Fun.place_stone!(game, FieldValue(1)) # 1 missing
    Just4Fun.place_stone!(game, FieldValue(11))
    Just4Fun.place_stone!(game, FieldValue(31))
    Just4Fun.place_stone!(game, FieldValue(29))
    
    Just4Fun.update_status!(game)

    @test game.winner == Player(0)
    @test game.state == in_progress
  end

  @testset "action-independent (no majority) 2" begin
    game = GI.init(Just4FunSpec())

    @test game.winner == Player(0)
    @test game.state == in_progress

    #make player yellow win
    #  1 14 30 24 19  8 ;
    # 33 11  9 16 35 21 ;
    #  6 27 31 20  3 12 ;
    # 15 32  5 29 17 26 ;
    # 22 10 18 36 25  2 ;
    # 28  7 23  4 13 34
    game.curplayer = Just4Fun.RED
    Just4Fun.place_stone!(game, FieldValue(1))
    game.curplayer = Just4Fun.YELLOW
    Just4Fun.place_stone!(game, FieldValue(1))
    Just4Fun.place_stone!(game, FieldValue(1))
    Just4Fun.place_stone!(game, FieldValue(11))
    #place_stone!(game, FieldValue(31)) 31 missing for connection
    Just4Fun.place_stone!(game, FieldValue(29))
    
    Just4Fun.update_status!(game)

    @test game.winner == Player(0)
    @test game.state == in_progress
  end

  @testset "curplayerstones" begin
    game = GI.init(Just4FunSpec())
    game.player_stones = @SVector [Stones(1), Stones(2)]

    game.curplayer = Player(YELLOW)
    @test Just4Fun.curplayerstones(game) == Stones(1)
    game.curplayer = Player(RED)
    @test Just4Fun.curplayerstones(game) == Stones(2)
  end
    
  @testset "playerstones" begin
    game = GI.init(Just4FunSpec())
    game.player_stones = @SVector [Stones(1), Stones(2)]
    
    @test Just4Fun.playerstones(game, Player(YELLOW)) == Stones(1)
    @test Just4Fun.playerstones(game, Player(RED)) == Stones(2)
  end
end

##########

@testset "winner_by_numbers" begin

  @testset "draw (same number of stones)" begin
    spec = Just4FunSpec()
    game = GI.init(spec)
    player1 = Player(YELLOW)
    player2 = Player(RED)

    game.curplayer = player1
    Just4Fun.place_stone!(game, FieldValue(4))
    Just4Fun.place_stone!(game, FieldValue(7))

    game.curplayer = player2
    Just4Fun.place_stone!(game, FieldValue(4))
    Just4Fun.place_stone!(game, FieldValue(7))
    
    @test Just4Fun.winner_by_numbers(spec, game) == (Player(0), end_by_draw)
  end
  
  @testset "player 1 has more" begin
    spec = Just4FunSpec()
    game = GI.init(spec)
    player1 = Player(YELLOW)
    player2 = Player(RED)
    
    game.curplayer = player1
    Just4Fun.place_stone!(game, FieldValue(4))
    Just4Fun.place_stone!(game, FieldValue(5))

    game.curplayer = player2
    Just4Fun.place_stone!(game, FieldValue(1))
    
    @test Just4Fun.winner_by_numbers(spec, game) == (player1, end_by_points)
  end
  
  
  @testset "player 2 has more" begin
    spec = Just4FunSpec()
    game = GI.init(spec)
    player1 = Player(YELLOW)
    player2 = Player(RED)

    game.curplayer = player1
    Just4Fun.place_stone!(game, FieldValue(4))

    game.curplayer = player2
    Just4Fun.place_stone!(game, FieldValue(1))
    Just4Fun.place_stone!(game, FieldValue(8))
    
    @test Just4Fun.winner_by_numbers(spec, game) == (player2, end_by_points)
  end
  
  @testset "same points but player 1 has highest field" begin
    spec = Just4FunSpec()
    game = GI.init(spec)
    player1 = Player(YELLOW)
    player2 = Player(RED)
    
    game.curplayer = player1
    Just4Fun.place_stone!(game, FieldValue(1))
    Just4Fun.place_stone!(game, FieldValue(8))

    game.curplayer = player2
    Just4Fun.place_stone!(game, FieldValue(4))
    Just4Fun.place_stone!(game, FieldValue(5))
    
    @test Just4Fun.winner_by_numbers(spec, game) == (player1, end_by_max_field)
  end
  
  
  @testset "same points but player 2 has highest field" begin
    spec = Just4FunSpec()
    game = GI.init(spec)
    player1 = Player(YELLOW)
    player2 = Player(RED)

    game.curplayer = player1
    Just4Fun.place_stone!(game, FieldValue(7))
    Just4Fun.place_stone!(game, FieldValue(2))

    game.curplayer = player2
    Just4Fun.place_stone!(game, FieldValue(1))
    Just4Fun.place_stone!(game, FieldValue(8))
    
    @test Just4Fun.winner_by_numbers(spec, game) == (player2, end_by_max_field)
  end
end