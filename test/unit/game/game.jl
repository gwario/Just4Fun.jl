@testset "Field distribution indexing (just 4 fun default dist)" begin
  # 1st row
  @test Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST[1, 1] == 1
  @test Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST[1, 2] == 14
  @test Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST[1, 3] == 30
  @test Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST[1, 4] == 24
  @test Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST[1, 5] == 19
  @test Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST[1, 6] == 8
  # 2nd row
  @test Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST[2, 1] == 33
  @test Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST[2, 2] == 11
  @test Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST[2, 3] == 9
  @test Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST[2, 4] == 16
  @test Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST[2, 5] == 35
  @test Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST[2, 6] == 21
  # 3rd row
  @test Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST[3, 1] == 6
  @test Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST[3, 2] == 27
  @test Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST[3, 3] == 31
  @test Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST[3, 4] == 20
  @test Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST[3, 5] == 3
  @test Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST[3, 6] == 12
  # 4th row
  @test Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST[4, 1] == 15
  @test Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST[4, 2] == 32
  @test Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST[4, 3] == 5
  @test Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST[4, 4] == 29
  @test Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST[4, 5] == 17
  @test Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST[4, 6] == 26
  # 5th row
  @test Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST[5, 1] == 22
  @test Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST[5, 2] == 10
  @test Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST[5, 3] == 18
  @test Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST[5, 4] == 36
  @test Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST[5, 5] == 25
  @test Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST[5, 6] == 2
  # 6th row
  @test Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST[6, 1] == 28
  @test Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST[6, 2] == 7
  @test Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST[6, 3] == 23
  @test Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST[6, 4] == 4
  @test Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST[6, 5] == 13
  @test Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST[6, 6] == 34
end

@testset "Field value indexing" begin
  # 1st row
  @test Just4Fun.FIELD_VALUES[1, 1] == 1
  @test Just4Fun.FIELD_VALUES[1, 2] == 14
  @test Just4Fun.FIELD_VALUES[1, 3] == 30
  @test Just4Fun.FIELD_VALUES[1, 4] == 24
  @test Just4Fun.FIELD_VALUES[1, 5] == 19
  @test Just4Fun.FIELD_VALUES[1, 6] == 8
  # 2nd row
  @test Just4Fun.FIELD_VALUES[2, 1] == 33
  @test Just4Fun.FIELD_VALUES[2, 2] == 11
  @test Just4Fun.FIELD_VALUES[2, 3] == 9
  @test Just4Fun.FIELD_VALUES[2, 4] == 16
  @test Just4Fun.FIELD_VALUES[2, 5] == 35
  @test Just4Fun.FIELD_VALUES[2, 6] == 21
  # 3rd row
  @test Just4Fun.FIELD_VALUES[3, 1] == 6
  @test Just4Fun.FIELD_VALUES[3, 2] == 27
  @test Just4Fun.FIELD_VALUES[3, 3] == 31
  @test Just4Fun.FIELD_VALUES[3, 4] == 20
  @test Just4Fun.FIELD_VALUES[3, 5] == 3
  @test Just4Fun.FIELD_VALUES[3, 6] == 12
  # 4th row
  @test Just4Fun.FIELD_VALUES[4, 1] == 15
  @test Just4Fun.FIELD_VALUES[4, 2] == 32
  @test Just4Fun.FIELD_VALUES[4, 3] == 5
  @test Just4Fun.FIELD_VALUES[4, 4] == 29
  @test Just4Fun.FIELD_VALUES[4, 5] == 17
  @test Just4Fun.FIELD_VALUES[4, 6] == 26
  # 5th row
  @test Just4Fun.FIELD_VALUES[5, 1] == 22
  @test Just4Fun.FIELD_VALUES[5, 2] == 10
  @test Just4Fun.FIELD_VALUES[5, 3] == 18
  @test Just4Fun.FIELD_VALUES[5, 4] == 36
  @test Just4Fun.FIELD_VALUES[5, 5] == 25
  @test Just4Fun.FIELD_VALUES[5, 6] == 2
  # 6th row
  @test Just4Fun.FIELD_VALUES[6, 1] == 28
  @test Just4Fun.FIELD_VALUES[6, 2] == 7
  @test Just4Fun.FIELD_VALUES[6, 3] == 23
  @test Just4Fun.FIELD_VALUES[6, 4] == 4
  @test Just4Fun.FIELD_VALUES[6, 5] == 13
  @test Just4Fun.FIELD_VALUES[6, 6] == 34
end

@testset "Deck of cards" begin
  deck_of_cards = convert(Array{Int64}, Just4Fun.JUST4FUN_DEFAULT_DECK)

  @testset "deck of cards contains the cards from 1-12, four times each" begin
    @test length(findall(card -> card ==  1, deck_of_cards)) == 4
    @test length(findall(card -> card ==  2, deck_of_cards)) == 4
    @test length(findall(card -> card ==  3, deck_of_cards)) == 4
    @test length(findall(card -> card ==  4, deck_of_cards)) == 4
    @test length(findall(card -> card ==  5, deck_of_cards)) == 4
    @test length(findall(card -> card ==  6, deck_of_cards)) == 4
    @test length(findall(card -> card ==  7, deck_of_cards)) == 4
    @test length(findall(card -> card ==  8, deck_of_cards)) == 4
    @test length(findall(card -> card ==  9, deck_of_cards)) == 4
    @test length(findall(card -> card == 10, deck_of_cards)) == 4
    @test length(findall(card -> card == 11, deck_of_cards)) == 4
    @test length(findall(card -> card == 12, deck_of_cards)) == 4
  end

  @testset "deck of cards contains the cards from 13-19 once each" begin
    @test length(findall(card -> card == 13, deck_of_cards)) == 1
    @test length(findall(card -> card == 14, deck_of_cards)) == 1
    @test length(findall(card -> card == 15, deck_of_cards)) == 1
    @test length(findall(card -> card == 16, deck_of_cards)) == 1
    @test length(findall(card -> card == 17, deck_of_cards)) == 1
    @test length(findall(card -> card == 18, deck_of_cards)) == 1
    @test length(findall(card -> card == 19, deck_of_cards)) == 1
  end
end

@testset "Game settings" begin
  @testset "Is two player game" begin
    @test GI.two_players(Just4FunSpec()) == true
  end
end

@testset "Game State" begin
  @testset "Get state returns set state game" begin
    expected_state = Just4FunEnvState((
      stack=Vector{CardValue}(), used_cards=Cards(),
      player_cards=SMatrix{4, 2}([
        0x01 0x01 ;
        0x02 0x02 ;
        0x03 0x03 ;
        0x04 0x04
      ]),
      field_stones=SArray{Tuple{6, 6, 2}, Stones}([
        # p1
        0x01 0x00 0x00 0x00 0x00 0x00;
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
      ]),
      player_stones=SVector{2, Stones}(repeat([Stones(0)], 2)),
      curplayer=Player(Just4Fun.YELLOW),
      state=in_progress,
      action_indices=[]
    ))
    game = GI.init(Just4FunSpec(), expected_state)
    
    actual_state = GI.current_state(game)
    
    @test actual_state.stack         == expected_state.stack
    @test actual_state.used_cards    == expected_state.used_cards
    @test actual_state.player_cards  == expected_state.player_cards
    @test actual_state.field_stones  == expected_state.field_stones
    @test actual_state.player_stones == expected_state.player_stones
    @test actual_state.curplayer     == expected_state.curplayer
    
  end
end

#####

@testset "Actions" begin
  @testset "there are no card combinations with a sum of more than 36" begin
    @test findall(a -> a.value > FieldValue(36), GI.actions(Just4FunSpec())) == []
  end

  @testset "there are no card combinations with a sum of less than 0" begin
    @test findall(a -> a.value <  FieldValue(0), GI.actions(Just4FunSpec())) == []
  end

  @testset "there is one special action with pos 0 for redrawing cards" begin
    @test length(findall(a -> a.value == FieldValue(0), GI.actions(Just4FunSpec()))) == 1
  end
end

@testset "Init, set state, reward and termination" begin
  @testset "four in a row (1,1 -> 4,1) for player yellow makes white reward 1 and game terminated true" begin

    state = Just4FunEnvState((
      stack=Vector{CardValue}(), used_cards=Just4Fun.Cards(),
      player_cards=SMatrix{4, 2}([
        0x01 0x01 ;
        0x02 0x02 ;
        0x03 0x03 ;
        0x04 0x04
      ]),
      field_stones=SArray{Tuple{6, 6, 2}, Stones}([
        # p1
        0x01 0x01 0x01 0x01 0x00 0x00;
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
      ]),
      player_stones=SVector{2, Stones}(repeat([Stones(0)], 2)),
      curplayer=Player(Just4Fun.YELLOW),
      state=in_progress,
      action_indices=[]
    ))
    game = GI.init(Just4FunSpec(), state)
    
    @test GI.white_reward(game) == 1.0
    @test GI.game_terminated(game) == true
  end

  @testset "four in a row (1,1 -> 1,4) for player yellow makes white reward 1 and game terminated true" begin

    state = Just4FunEnvState((
      stack=Vector{CardValue}(), used_cards=Just4Fun.Cards(),
      player_cards=SMatrix{4, 2}([
        0x01 0x01 ;
        0x02 0x02 ;
        0x03 0x03 ;
        0x04 0x04
      ]),
      field_stones=SArray{Tuple{6, 6, 2}, Stones}([
        # p1
        0x01 0x00 0x00 0x00 0x00 0x00;
        0x01 0x00 0x00 0x00 0x00 0x00;
        0x01 0x00 0x00 0x00 0x00 0x00;
        0x01 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;;;
        # p2
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00
      ]),
      player_stones=SVector{2, Stones}(repeat([Stones(0)], 2)),
      curplayer=Player(Just4Fun.YELLOW),
      state=in_progress,
      action_indices=[]
    ))
    game = GI.init(Just4Fun.Just4FunSpec(), state)
    
    @test GI.white_reward(game) == 1.0
    @test GI.game_terminated(game) == true
  end

  @testset "four in a row (1,6 -> 4,2 diagonal) for player yellow makes white reward 1 and game terminated true" begin

    state = Just4FunEnvState((
      stack=Vector{CardValue}(), used_cards=Cards(),
      player_cards=SMatrix{4, 2}([
        0x01 0x01 ;
        0x02 0x02 ;
        0x03 0x03 ;
        0x04 0x04
      ]),
      field_stones = SArray{Tuple{6, 6, 2}, Stones}([
        # p1
        0x00 0x00 0x00 0x00 0x00 0x01;
        0x00 0x00 0x00 0x00 0x01 0x00;
        0x00 0x00 0x00 0x01 0x00 0x00;
        0x00 0x00 0x01 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;;;
        # p2
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00
      ]),
      player_stones=SVector{2, Stones}(repeat([Stones(0)], 2)),
      curplayer=Player(Just4Fun.YELLOW),
      state=in_progress,
      action_indices=[]
    ))
    game = GI.init(Just4FunSpec(), state)
    
    @test GI.white_reward(game) == 1.0
    @test GI.game_terminated(game) == true

  end

  #####

  @testset "four in a row (1,1 -> 4,1) for player red makes white reward -1 and game terminated true" begin

    state = Just4FunEnvState((
      stack=Vector{CardValue}(), used_cards=Cards(),
      player_cards=SMatrix{4, 2}([
        0x01 0x01 ;
        0x02 0x02 ;
        0x03 0x03 ;
        0x04 0x04
      ]),
      field_stones=SArray{Tuple{6, 6, 2}, Stones}([
        # p1
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;;;
        # p2
        0x01 0x01 0x01 0x01 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00
      ]),
      player_stones=SVector{2, Stones}(repeat([Stones(0)], 2)),
      curplayer=Player(Just4Fun.YELLOW),
      state=in_progress,
      action_indices=[]
    ))
    game = GI.init(Just4FunSpec(), state)
    
    @test GI.white_reward(game) == -1.0
    @test GI.game_terminated(game) == true
  end

  @testset "four in a row (1,1 -> 1,4) for player red makes white reward -1 and game terminated true" begin

    state = Just4FunEnvState((
      stack=Vector{CardValue}(), used_cards=Cards(),
      player_cards=SMatrix{4, 2}([
        0x01 0x01 ;
        0x02 0x02 ;
        0x03 0x03 ;
        0x04 0x04
      ]),
      field_stones=SArray{Tuple{6, 6, 2}, Stones}([
        # p1
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;;;
        # p2
        0x01 0x00 0x00 0x00 0x00 0x00;
        0x01 0x00 0x00 0x00 0x00 0x00;
        0x01 0x00 0x00 0x00 0x00 0x00;
        0x01 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00
      ]),
      player_stones=SVector{2, Stones}(repeat([Stones(0)], 2)),
      curplayer=Player(Just4Fun.YELLOW),
      state=in_progress,
      action_indices=[]
    ))
    game = GI.init(Just4FunSpec(), state)
    
    @test GI.white_reward(game) == -1.0
    @test GI.game_terminated(game) == true
  end

  @testset "four in a row (1,1 -> 4,4 diagonal) for player red makes white reward -1 and game terminated true" begin

    state = Just4FunEnvState((
      stack=Vector{CardValue}(), used_cards=Cards(),
      player_cards=SMatrix{4, 2}([
        0x01 0x01 ;
        0x02 0x02 ;
        0x03 0x03 ;
        0x04 0x04
      ]),
      field_stones=SArray{Tuple{6, 6, 2}, Stones}([
        # p1
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;;;
        # p2
        0x01 0x00 0x00 0x00 0x00 0x00;
        0x00 0x01 0x00 0x00 0x00 0x00;
        0x00 0x00 0x01 0x00 0x00 0x00;
        0x00 0x00 0x00 0x01 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00
      ]),
      player_stones=SVector{2, Stones}(repeat([Stones(0)], 2)),
      curplayer=Player(Just4Fun.YELLOW),
      state=in_progress,
      action_indices=[]
    ))
    game = GI.init(Just4FunSpec(), state)
    
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
      stack=stack, used_cards=Cards(),
      player_cards=SMatrix{4, 2}([
        0x01 0x01 ;
        0x02 0x02 ;
        0x03 0x03 ;
        0x04 0x04
      ]),
      field_stones=SArray{Tuple{6, 6, 2}, Stones}([
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
      ]),
      player_stones=SVector{2, Stones}(repeat([Stones(4)], 2)),
      curplayer=Player(Just4Fun.YELLOW),
      state=in_progress,
      action_indices=[]
    ))
    game = GI.init(Just4FunSpec(), state)
    
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
      stack=stack, used_cards=Cards(),
      player_cards=SMatrix{4, 2}([
        0x01 0x01 ;
        0x02 0x02 ;
        0x03 0x03 ;
        0x04 0x04
      ]),
      field_stones=SArray{Tuple{6, 6, 2}, Stones}([
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
      ]),
      player_stones=SVector{2, Stones}(repeat([Stones(4)], 2)),
      curplayer=Player(Just4Fun.YELLOW),
      state=in_progress,
      action_indices=[]
    ))
    game = GI.init(Just4FunSpec(), state)
    
    @test GI.white_playing(game) == true
  end

  @testset "if curplayer is red, white playing is false" begin
    
    stack = Vector{CardValue}()
    push!(stack, 0x1)
    push!(stack, 0x2)
    push!(stack, 0x3)
    push!(stack, 0x4)
    state = Just4FunEnvState((
      stack=stack, used_cards=Cards(),
      player_cards=SMatrix{4, 2}([
        0x01 0x01 ;
        0x02 0x02 ;
        0x03 0x03 ;
        0x04 0x04
      ]),
      field_stones=SArray{Tuple{6, 6, 2}, Stones}([
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
      ]),
      player_stones=SVector{2, Stones}(repeat([Stones(4)], 2)),
      curplayer=Player(Just4Fun.RED),
      state=in_progress,
      action_indices=[]
    ))
    game = GI.init(Just4FunSpec(), state)
    
    @test GI.white_playing(game) == false
  end

  #########

  # there can be no draw
  @testset "player with highest pos wins (yellow)" begin
    
    stack = Vector{CardValue}()
    state = Just4FunEnvState((
      stack=stack, used_cards=Cards(),
      player_cards=SMatrix{4, 2}([
        0x01 0x01 ;
        0x02 0x02 ;
        0x03 0x03 ;
        0x04 0x04
      ]),
      field_stones=SArray{Tuple{6, 6, 2}, Stones}([
        # p1
        0x00 0x00 0x01 0x00 0x00 0x00; # __ __ 30 __ __ __
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;;;
        # p2
        0x01 0x01 0x00 0x00 0x00 0x00; # _1 14 __ __ __ __
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00
      ]),
      player_stones=SVector{2, Stones}(repeat([Stones(0)], 2)),
      curplayer=Player(Just4Fun.YELLOW),
      state=in_progress,
      action_indices=[]
    ))
    game = GI.init(Just4FunSpec())
    GI.set_state!(game, state)
    
    @test GI.white_reward(game) == 1.0
    @test GI.game_terminated(game) == true
  end

  @testset "player with highest pos wins (yellow)" begin
    
    stack = Vector{CardValue}()
    state = Just4FunEnvState((
      stack=stack, used_cards=Cards(),
      player_cards=SMatrix{4, 2}([
        0x01 0x01 ;
        0x02 0x02 ;
        0x03 0x03 ;
        0x04 0x04
      ]),
      field_stones=SArray{Tuple{6, 6, 2}, Stones}([
        # p1
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x01 0x00 0x00 0x00 0x00 0x00; # 15 __ __ __ __ __
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;;;
        # p2
        0x01 0x01 0x00 0x00 0x00 0x00; # _1 14 __ __ __ __
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00
      ]),
      player_stones=SVector{2, Stones}(repeat([Stones(0)], 2)),
      curplayer=Player(Just4Fun.YELLOW),
      state=in_progress,
      action_indices=[]
    ))
    game = GI.init(Just4FunSpec())
    GI.set_state!(game, state)
    
    @test GI.white_reward(game) == -1.0
    @test GI.game_terminated(game) == true
  end

  #####

  @testset "player with most points wins (red)" begin
    
    stack = Vector{CardValue}()
    state = Just4FunEnvState((
      stack=stack, used_cards=Cards(),
      player_cards=SMatrix{4, 2}([
        0x01 0x01 ;
        0x02 0x02 ;
        0x03 0x03 ;
        0x04 0x04
      ]),
      field_stones=SArray{Tuple{6, 6, 2}, Stones}([
        # p1
        0x00 0x00 0x00 0x01 0x00 0x00; # __ __ __ 24 __ __
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;;;
        # p2
        0x01 0x01 0x01 0x00 0x00 0x00; # _1 14 30 __ __ __
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00
      ]),
      player_stones=SVector{2, Stones}(repeat([Stones(0)], 2)),
      curplayer=Player(Just4Fun.YELLOW),
      state=in_progress,
      action_indices=[]
    ))
    game = GI.init(Just4FunSpec())
    GI.set_state!(game, state)
    
    @test GI.white_reward(game) == -1.0
    @test GI.game_terminated(game) == true
  end

  @testset "player with most points wins (yellow)" begin
    
    stack = Vector{CardValue}()
    state = Just4FunEnvState((
      stack=stack, used_cards=Cards(),
      player_cards=SMatrix{4, 2}([
        0x01 0x01 ;
        0x02 0x02 ;
        0x03 0x03 ;
        0x04 0x04
      ]),
      field_stones=SArray{Tuple{6, 6, 2}, Stones}([
        # p1
        0x01 0x01 0x01 0x00 0x00 0x00; # _1 14 30 __ __ __
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;;;
        # p2
        0x00 0x00 0x00 0x01 0x00 0x00; # __ __ __ 24 __ __
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00;
        0x00 0x00 0x00 0x00 0x00 0x00
      ]),
      player_stones=SVector{2, Stones}(repeat([Stones(0)], 2)),
      curplayer=Player(Just4Fun.YELLOW),
      state=in_progress,
      action_indices=[]
    ))
    game = GI.init(Just4FunSpec())
    GI.set_state!(game, state)
    
    @test GI.white_reward(game) == 1.0
    @test GI.game_terminated(game) == true
  end
end