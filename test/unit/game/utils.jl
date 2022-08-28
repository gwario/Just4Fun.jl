@testset "flip_colors" begin
  @testset "returns array circular shifted" begin
    
    @test Just4Fun.flip_colors(SVector{2, Stones}([Stones(2), Stones(1)])) == SVector{2, Stones}([Stones(1), Stones(2)])

    @test Just4Fun.flip_colors(SVector{3, Stones}([Stones(1), Stones(2), Stones(3)])) == SVector{3, Stones}([Stones(2), Stones(3), Stones(1)])

  end
end

######

@testset "to index" begin
  @test Just4Fun.to_index(Just4Fun.YELLOW)  == 1
  @test Just4Fun.to_index(Just4Fun.RED)     == 2
  @test Just4Fun.to_index(Just4Fun.MAGENTA) == 3
  @test Just4Fun.to_index(Just4Fun.GREEN)   == 4
end

######

@testset "shuffle" begin
  Random.seed!(123)
  cards = [CardValue(1), Just4Fun.CardValue(2), Just4Fun.CardValue(3), Just4Fun.CardValue(4)]
  shuffled_cards = Just4Fun.shuffle(cards)
  @test collect(Iterators.reverse(shuffled_cards)) != cards
  @test issetequal(collect(Iterators.reverse(shuffled_cards)), cards)
end

######

@testset "Base.copy" begin
  
  stack = Stack{Just4Fun.CardValue}()
  push!(stack, Just4Fun.CardValue(1))
  push!(stack, Just4Fun.CardValue(2))
  push!(stack, Just4Fun.CardValue(3))
  push!(stack, Just4Fun.CardValue(4))

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

@testset "all_sorted_card_combinations" begin
  
  # all combinations of size up to 0 (only the empty list)
  combinations = Just4Fun.all_sorted_card_combinations(Just4Fun.Cards([
    Just4Fun.CardValue(1), Just4Fun.CardValue(2), Just4Fun.CardValue(3),
    Just4Fun.CardValue(4), Just4Fun.CardValue(5)
  ]), 0)
  @test combinations == [Just4Fun.Cards()]

  # all combinations of size up to 1
  combinations = Just4Fun.all_sorted_card_combinations(Just4Fun.Cards([
    Just4Fun.CardValue(1), Just4Fun.CardValue(2), Just4Fun.CardValue(3),
    Just4Fun.CardValue(4), Just4Fun.CardValue(5)
  ]), 1)
  @test combinations == [
    Just4Fun.Cards(),
    Just4Fun.Cards([Just4Fun.CardValue(1)]),
    Just4Fun.Cards([Just4Fun.CardValue(2)]),
    Just4Fun.Cards([Just4Fun.CardValue(3)]),
    Just4Fun.Cards([Just4Fun.CardValue(4)]),
    Just4Fun.Cards([Just4Fun.CardValue(5)])
  ]

  # all combinations of size up to 2
  combinations = Just4Fun.all_sorted_card_combinations(Just4Fun.Cards([
    Just4Fun.CardValue(1), Just4Fun.CardValue(2), Just4Fun.CardValue(3),
    Just4Fun.CardValue(4), Just4Fun.CardValue(5)
  ]), 2)
  @test issetequal(
    combinations, [
    Just4Fun.Cards(),
    Just4Fun.Cards([Just4Fun.CardValue(1)]),
    Just4Fun.Cards([Just4Fun.CardValue(2)]),
    Just4Fun.Cards([Just4Fun.CardValue(3)]),
    Just4Fun.Cards([Just4Fun.CardValue(4)]),
    Just4Fun.Cards([Just4Fun.CardValue(5)]),
    Just4Fun.Cards([Just4Fun.CardValue(1), Just4Fun.CardValue(2)]),
    Just4Fun.Cards([Just4Fun.CardValue(1), Just4Fun.CardValue(3)]),
    Just4Fun.Cards([Just4Fun.CardValue(1), Just4Fun.CardValue(4)]),
    Just4Fun.Cards([Just4Fun.CardValue(1), Just4Fun.CardValue(5)]),
    Just4Fun.Cards([Just4Fun.CardValue(2), Just4Fun.CardValue(3)]),
    Just4Fun.Cards([Just4Fun.CardValue(2), Just4Fun.CardValue(4)]), 
    Just4Fun.Cards([Just4Fun.CardValue(2), Just4Fun.CardValue(5)]),
    Just4Fun.Cards([Just4Fun.CardValue(3), Just4Fun.CardValue(4)]), 
    Just4Fun.Cards([Just4Fun.CardValue(3), Just4Fun.CardValue(5)]),
    Just4Fun.Cards([Just4Fun.CardValue(4), Just4Fun.CardValue(5)]), 
  ])

  # all combinations of size up to 3
  combinations = Just4Fun.all_sorted_card_combinations(Just4Fun.Cards([
    Just4Fun.CardValue(1), Just4Fun.CardValue(2), Just4Fun.CardValue(3),
    Just4Fun.CardValue(4), Just4Fun.CardValue(5)
  ]), 3)
  @test issetequal(
    combinations, [
    Just4Fun.Cards(), Just4Fun.Cards([Just4Fun.CardValue(1)]),
    Just4Fun.Cards([Just4Fun.CardValue(2)]), Just4Fun.Cards([Just4Fun.CardValue(3)]),
    Just4Fun.Cards([Just4Fun.CardValue(4)]), Just4Fun.Cards([Just4Fun.CardValue(5)]),
    Just4Fun.Cards([Just4Fun.CardValue(1), Just4Fun.CardValue(2)]), Just4Fun.Cards([Just4Fun.CardValue(1), Just4Fun.CardValue(3)]),
    Just4Fun.Cards([Just4Fun.CardValue(1), Just4Fun.CardValue(4)]), Just4Fun.Cards([Just4Fun.CardValue(1), Just4Fun.CardValue(5)]),
    Just4Fun.Cards([Just4Fun.CardValue(2), Just4Fun.CardValue(3)]), Just4Fun.Cards([Just4Fun.CardValue(2), Just4Fun.CardValue(4)]), 
    Just4Fun.Cards([Just4Fun.CardValue(2), Just4Fun.CardValue(5)]), Just4Fun.Cards([Just4Fun.CardValue(3), Just4Fun.CardValue(4)]), 
    Just4Fun.Cards([Just4Fun.CardValue(3), Just4Fun.CardValue(5)]), Just4Fun.Cards([Just4Fun.CardValue(4), Just4Fun.CardValue(5)]), 
    Just4Fun.Cards([Just4Fun.CardValue(1), Just4Fun.CardValue(2), Just4Fun.CardValue(3)]), 
    Just4Fun.Cards([Just4Fun.CardValue(1), Just4Fun.CardValue(2), Just4Fun.CardValue(4)]), 
    Just4Fun.Cards([Just4Fun.CardValue(1), Just4Fun.CardValue(2), Just4Fun.CardValue(5)]), 
    Just4Fun.Cards([Just4Fun.CardValue(1), Just4Fun.CardValue(3), Just4Fun.CardValue(4)]), 
    Just4Fun.Cards([Just4Fun.CardValue(1), Just4Fun.CardValue(3), Just4Fun.CardValue(5)]), 
    Just4Fun.Cards([Just4Fun.CardValue(1), Just4Fun.CardValue(4), Just4Fun.CardValue(5)]), 
    Just4Fun.Cards([Just4Fun.CardValue(2), Just4Fun.CardValue(3), Just4Fun.CardValue(4)]), 
    Just4Fun.Cards([Just4Fun.CardValue(2), Just4Fun.CardValue(3), Just4Fun.CardValue(5)]), 
    Just4Fun.Cards([Just4Fun.CardValue(2), Just4Fun.CardValue(4), Just4Fun.CardValue(5)]), 
    Just4Fun.Cards([Just4Fun.CardValue(3), Just4Fun.CardValue(4), Just4Fun.CardValue(5)])
  ])

  #### With duplicates

  # all combinations of size up to 1
  combinations = Just4Fun.all_sorted_card_combinations(Just4Fun.Cards([
    Just4Fun.CardValue(1), Just4Fun.CardValue(1), Just4Fun.CardValue(2),
    Just4Fun.CardValue(2), Just4Fun.CardValue(3)
  ]), 1)
  @test issetequal(
    combinations, [
    Just4Fun.Cards(),
    Just4Fun.Cards([Just4Fun.CardValue(1)]),
    Just4Fun.Cards([Just4Fun.CardValue(2)]),
    Just4Fun.Cards([Just4Fun.CardValue(3)])
  ])

  # all combinations of size up to 2
  combinations = Just4Fun.all_sorted_card_combinations(Just4Fun.Cards([
    Just4Fun.CardValue(1), Just4Fun.CardValue(1), Just4Fun.CardValue(2),
    Just4Fun.CardValue(2), Just4Fun.CardValue(3)
  ]), 2)
  @test issetequal(
    combinations, [
    Just4Fun.Cards(),
    Just4Fun.Cards([Just4Fun.CardValue(1)]),
    Just4Fun.Cards([Just4Fun.CardValue(2)]),
    Just4Fun.Cards([Just4Fun.CardValue(3)]),
    Just4Fun.Cards([Just4Fun.CardValue(1), Just4Fun.CardValue(1)]), 
    Just4Fun.Cards([Just4Fun.CardValue(2), Just4Fun.CardValue(2)]),
    Just4Fun.Cards([Just4Fun.CardValue(1), Just4Fun.CardValue(2)]),
    Just4Fun.Cards([Just4Fun.CardValue(1), Just4Fun.CardValue(3)]),
    Just4Fun.Cards([Just4Fun.CardValue(2), Just4Fun.CardValue(3)])
  ])

  # all combinations of size up to 3
  combinations = Just4Fun.all_sorted_card_combinations(Just4Fun.Cards([
    Just4Fun.CardValue(1), Just4Fun.CardValue(1), Just4Fun.CardValue(2),
    Just4Fun.CardValue(2), Just4Fun.CardValue(3)
  ]), 3)
  @test issetequal(
    combinations, [
    Just4Fun.Cards(),
    Just4Fun.Cards([Just4Fun.CardValue(1)]),
    Just4Fun.Cards([Just4Fun.CardValue(2)]),
    Just4Fun.Cards([Just4Fun.CardValue(3)]),
    Just4Fun.Cards([Just4Fun.CardValue(1), Just4Fun.CardValue(1)]), 
    Just4Fun.Cards([Just4Fun.CardValue(2), Just4Fun.CardValue(2)]),
    Just4Fun.Cards([Just4Fun.CardValue(1), Just4Fun.CardValue(2)]),
    Just4Fun.Cards([Just4Fun.CardValue(1), Just4Fun.CardValue(3)]),
    Just4Fun.Cards([Just4Fun.CardValue(2), Just4Fun.CardValue(3)]),
    Just4Fun.Cards([Just4Fun.CardValue(1), Just4Fun.CardValue(1), Just4Fun.CardValue(2)]), 
    Just4Fun.Cards([Just4Fun.CardValue(1), Just4Fun.CardValue(1), Just4Fun.CardValue(3)]), 
    Just4Fun.Cards([Just4Fun.CardValue(1), Just4Fun.CardValue(2), Just4Fun.CardValue(2)]), 
    Just4Fun.Cards([Just4Fun.CardValue(1), Just4Fun.CardValue(2), Just4Fun.CardValue(3)]), 
    Just4Fun.Cards([Just4Fun.CardValue(2), Just4Fun.CardValue(2), Just4Fun.CardValue(3)])
  ])

  ##### With more duplicates

  # all combinations of size up to 1
  combinations = Just4Fun.all_sorted_card_combinations(Just4Fun.Cards([
    Just4Fun.CardValue(1), Just4Fun.CardValue(1), Just4Fun.CardValue(1),
    Just4Fun.CardValue(2), Just4Fun.CardValue(2)
  ]), 1)
  @test issetequal(
    combinations, [
    Just4Fun.Cards(),
    Just4Fun.Cards([Just4Fun.CardValue(1)]),
    Just4Fun.Cards([Just4Fun.CardValue(2)])
  ])

  # all combinations of size up to 2
  combinations = Just4Fun.all_sorted_card_combinations(Just4Fun.Cards([
    Just4Fun.CardValue(1), Just4Fun.CardValue(1), Just4Fun.CardValue(1),
    Just4Fun.CardValue(2), Just4Fun.CardValue(2)
  ]), 2)
  @test issetequal(
    combinations, [
    Just4Fun.Cards(),
    Just4Fun.Cards([Just4Fun.CardValue(1)]),
    Just4Fun.Cards([Just4Fun.CardValue(2)]),
    Just4Fun.Cards([Just4Fun.CardValue(1), Just4Fun.CardValue(1)]),
    Just4Fun.Cards([Just4Fun.CardValue(1), Just4Fun.CardValue(2)]),
    Just4Fun.Cards([Just4Fun.CardValue(2), Just4Fun.CardValue(2)])
  ])

  # all combinations of size up to 3
  combinations = Just4Fun.all_sorted_card_combinations(Just4Fun.Cards([
    Just4Fun.CardValue(1), Just4Fun.CardValue(1), Just4Fun.CardValue(1),
    Just4Fun.CardValue(2), Just4Fun.CardValue(2)
  ]), 3)
  @test issetequal(
    combinations, [
    Just4Fun.Cards(),
    Just4Fun.Cards([Just4Fun.CardValue(1)]),
    Just4Fun.Cards([Just4Fun.CardValue(2)]),
    Just4Fun.Cards([Just4Fun.CardValue(1), Just4Fun.CardValue(1)]),
    Just4Fun.Cards([Just4Fun.CardValue(1), Just4Fun.CardValue(2)]),
    Just4Fun.Cards([Just4Fun.CardValue(2), Just4Fun.CardValue(2)]),
    Just4Fun.Cards([Just4Fun.CardValue(1), Just4Fun.CardValue(1), Just4Fun.CardValue(1)]),
    Just4Fun.Cards([Just4Fun.CardValue(1), Just4Fun.CardValue(1), Just4Fun.CardValue(2)]),
    Just4Fun.Cards([Just4Fun.CardValue(1), Just4Fun.CardValue(2), Just4Fun.CardValue(2)])
  ])

  # all combinations of size up to 4
  combinations = Just4Fun.all_sorted_card_combinations(Just4Fun.Cards([
    Just4Fun.CardValue(1), Just4Fun.CardValue(1), Just4Fun.CardValue(1),
    Just4Fun.CardValue(2), Just4Fun.CardValue(2)
  ]), 4)
  @test issetequal(
    combinations, [
    Just4Fun.Cards(),
    Just4Fun.Cards([Just4Fun.CardValue(1)]),
    Just4Fun.Cards([Just4Fun.CardValue(2)]),
    Just4Fun.Cards([Just4Fun.CardValue(1), Just4Fun.CardValue(1)]),
    Just4Fun.Cards([Just4Fun.CardValue(1), Just4Fun.CardValue(2)]),
    Just4Fun.Cards([Just4Fun.CardValue(2), Just4Fun.CardValue(2)]),
    Just4Fun.Cards([Just4Fun.CardValue(1), Just4Fun.CardValue(1), Just4Fun.CardValue(1)]),
    Just4Fun.Cards([Just4Fun.CardValue(1), Just4Fun.CardValue(1), Just4Fun.CardValue(2)]),
    Just4Fun.Cards([Just4Fun.CardValue(1), Just4Fun.CardValue(2), Just4Fun.CardValue(2)]),
    Just4Fun.Cards([Just4Fun.CardValue(1), Just4Fun.CardValue(1), Just4Fun.CardValue(1), Just4Fun.CardValue(2)]),
    Just4Fun.Cards([Just4Fun.CardValue(1), Just4Fun.CardValue(1), Just4Fun.CardValue(2), Just4Fun.CardValue(2)])
  ])
end

######

@testset "regular_combinations" begin
  spec = Just4FunSpec()


  # all combinations of size up to 0 (only the empty list)
  combinations = Just4Fun.regular_combinations(FIELD_VALUES, Cards([
    CardValue(1), CardValue(2), CardValue(3), CardValue(4)
  ]))
  
  @test issetequal(
    combinations, [
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
      Cards([CardValue(1), CardValue(2), CardValue(3), CardValue(4)])
  ])
 
end

######

@testset "generate_card_actions" begin
  @testset "accending field values" begin
    actions = Just4Fun.generate_card_actions(
      (@SVector FieldValue[
        0x18, 0x05, 0x13, 0x0a, 0x09, 0x19, 0x1d, 0x1e, 0x03, 0x10, 0x12, 0x23, 0x0b, 0x01, 0x24, 0x14, 0x1f, 0x06,
        0x22, 0x07, 0x08, 0x0f, 0x17, 0x04, 0x1a, 0x16, 0x0d, 0x0e, 0x1b, 0x02, 0x0c, 0x20, 0x11, 0x21, 0x15, 0x1c]),
      [0x1, 0x2, 0x1, 0x2, 0x3, 0x4],
      2
    )
    @test issetequal(actions, [
      (cards=[], value=0),
      (cards=Just4Fun.Cards([Just4Fun.CardValue(1)]), value=1),
      (cards=Just4Fun.Cards([Just4Fun.CardValue(2)]), value=2),
      (cards=Just4Fun.Cards([Just4Fun.CardValue(3)]), value=3),
      (cards=Just4Fun.Cards([Just4Fun.CardValue(4)]), value=4),
      (cards=Just4Fun.Cards([Just4Fun.CardValue(1), Just4Fun.CardValue(1)]), value=2),
      (cards=Just4Fun.Cards([Just4Fun.CardValue(1), Just4Fun.CardValue(2)]), value=3),
      (cards=Just4Fun.Cards([Just4Fun.CardValue(1), Just4Fun.CardValue(3)]), value=4),
      (cards=Just4Fun.Cards([Just4Fun.CardValue(1), Just4Fun.CardValue(4)]), value=5),
      (cards=Just4Fun.Cards([Just4Fun.CardValue(2), Just4Fun.CardValue(2)]), value=4),
      (cards=Just4Fun.Cards([Just4Fun.CardValue(2), Just4Fun.CardValue(3)]), value=5),
      (cards=Just4Fun.Cards([Just4Fun.CardValue(2), Just4Fun.CardValue(4)]), value=6),
      (cards=Just4Fun.Cards([Just4Fun.CardValue(3), Just4Fun.CardValue(4)]), value=7) 
    ])
  end
  @testset "random field values" begin
    actions = Just4Fun.generate_card_actions(
      (@SVector FieldValue[
        0x18, 0x05, 0x13, 0x0a, 0x09, 0x19, 0x1d, 0x1e, 0x03, 0x10, 0x12, 0x23, 0x0b, 0x01, 0x24, 0x14, 0x1f, 0x06,
        0x22, 0x07, 0x08, 0x0f, 0x17, 0x04, 0x1a, 0x16, 0x0d, 0x0e, 0x1b, 0x02, 0x0c, 0x20, 0x11, 0x21, 0x15, 0x1c]),
      [0x1, 0x2, 0x1, 0x2, 0x3, 0x4],
      2
    )
    @test issetequal(actions, [ #generate_card_actions
      (cards=[], value=0),
      (cards=Just4Fun.Cards([Just4Fun.CardValue(1)]), value=1),
      (cards=Just4Fun.Cards([Just4Fun.CardValue(2)]), value=2),
      (cards=Just4Fun.Cards([Just4Fun.CardValue(3)]), value=3),
      (cards=Just4Fun.Cards([Just4Fun.CardValue(4)]), value=4),
      (cards=Just4Fun.Cards([Just4Fun.CardValue(1), Just4Fun.CardValue(1)]), value=2),
      (cards=Just4Fun.Cards([Just4Fun.CardValue(1), Just4Fun.CardValue(2)]), value=3),
      (cards=Just4Fun.Cards([Just4Fun.CardValue(1), Just4Fun.CardValue(3)]), value=4),
      (cards=Just4Fun.Cards([Just4Fun.CardValue(1), Just4Fun.CardValue(4)]), value=5),
      (cards=Just4Fun.Cards([Just4Fun.CardValue(2), Just4Fun.CardValue(2)]), value=4),
      (cards=Just4Fun.Cards([Just4Fun.CardValue(2), Just4Fun.CardValue(3)]), value=5),
      (cards=Just4Fun.Cards([Just4Fun.CardValue(2), Just4Fun.CardValue(4)]), value=6),
      (cards=Just4Fun.Cards([Just4Fun.CardValue(3), Just4Fun.CardValue(4)]), value=7)
    ])
  end
  @testset "random field limited by max field" begin
    actions = Just4Fun.generate_card_actions(
      (@SVector FieldValue[
        0x18, 0x05, 0x13, 0x0a, 0x09, 0x19, 0x1d, 0x1e, 0x03, 0x10, 0x12, 0x23, 0x0b, 0x01, 0x24, 0x14, 0x1f, 0x06,
        0x22, 0x07, 0x08, 0x0f, 0x17, 0x04, 0x1a, 0x16, 0x0d, 0x0e, 0x1b, 0x02, 0x0c, 0x20, 0x11, 0x21, 0x15, 0x1c]),
      [0x1, 0x1, 0x2, 0xff],
      2
    )
    @test issetequal(actions, [
      (cards=[], value=0),
      (cards=Just4Fun.Cards([Just4Fun.CardValue(1)]), value=1),
      (cards=Just4Fun.Cards([Just4Fun.CardValue(2)]), value=2),
      (cards=Just4Fun.Cards([Just4Fun.CardValue(1), Just4Fun.CardValue(1)]), value=2),
      (cards=Just4Fun.Cards([Just4Fun.CardValue(1), Just4Fun.CardValue(2)]), value=3)
    ])
  end
  @testset "field values order has no impact" begin
    @test Just4Fun.generate_card_actions(
      (@SVector FieldValue[
        0x18, 0x05, 0x13, 0x0a, 0x09, 0x19, 0x1d, 0x1e, 0x03, 0x10, 0x12, 0x23, 0x0b, 0x01, 0x24, 0x14, 0x1f, 0x06,
        0x22, 0x07, 0x08, 0x0f, 0x17, 0x04, 0x1a, 0x16, 0x0d, 0x0e, 0x1b, 0x02, 0x0c, 0x20, 0x11, 0x21, 0x15, 0x1c]),
      [0x1, 0x2, 0x1, 0x2, 0x3, 0x4],
      2
    ) == Just4Fun.generate_card_actions(
      (@SVector FieldValue[
        0x05, 0x02, 0x21, 0x1c, 0x0d, 0x18, 0x14, 0x0f, 0x0b, 0x24, 0x19, 0x23, 0x11, 0x17, 0x16, 0x03, 0x04, 0x20,
        0x15, 0x13, 0x1b, 0x01, 0x1d, 0x0c, 0x1a, 0x10, 0x1e, 0x1f, 0x12, 0x07, 0x09, 0x22, 0x0e, 0x08, 0x06, 0x0a]),
      [0x1, 0x2, 0x1, 0x2, 0x3, 0x4],
      2
    )
  end
end

######

@testset "generate_nocard_actions" begin
  actions1 = Just4Fun.generate_nocard_actions((@SVector FieldValue[
    0x18, 0x05, 0x13, 0x0a, 0x09, 0x19, 0x1d, 0x1e, 0x03, 0x10, 0x12, 0x23, 0x0b, 0x01, 0x24, 0x14, 0x1f, 0x06,
    0x22, 0x07, 0x08, 0x0f, 0x17, 0x04, 0x1a, 0x16, 0x0d, 0x0e, 0x1b, 0x02, 0x0c, 0x20, 0x11, 0x21, 0x15, 0x1c]))
  @test actions1[1:4] == [FieldValue(1), FieldValue(2), FieldValue(3), FieldValue(4)] 
  actions2 = Just4Fun.generate_nocard_actions((@SVector FieldValue[
    0x05, 0x02, 0x21, 0x1c, 0x0d, 0x18, 0x14, 0x0f, 0x0b, 0x24, 0x19, 0x23, 0x11, 0x17, 0x16, 0x03, 0x04, 0x20,
    0x15, 0x13, 0x1b, 0x01, 0x1d, 0x0c, 0x1a, 0x10, 0x1e, 0x1f, 0x12, 0x07, 0x09, 0x22, 0x0e, 0x08, 0x06, 0x0a]))
  @test actions2[1:4] == [FieldValue(1), FieldValue(2), FieldValue(3), FieldValue(4)] 
  @test actions1 == actions2
end

######

@testset "generate_action_mask_lookup_index (depends on FEATURE_CARDS)" begin
  if Just4Fun.FEATURE_CARDS
    @testset "CardsAction" begin
      actions = [
        Just4Fun.CardsAction((
          cards=[CardValue(1)],
          value=FieldValue(1))),
        Just4Fun.CardsAction((
          cards=[CardValue(1), CardValue(4), CardValue(8)],
          value=FieldValue(13))),
        Just4Fun.CardsAction((
          cards=[CardValue(4), CardValue(9)],
          value=FieldValue(13)))
      ]
      action_index = Just4Fun.generate_action_mask_lookup_index(actions)
  
      for (index, action) in enumerate(actions)
        @test action_index[action] == index
      end
    end
  
  else
    @testset "NoCardsAction" begin
      actions = [
        Just4Fun.NoCardsAction(FieldValue(1)),
        Just4Fun.NoCardsAction(FieldValue(33)),
        Just4Fun.NoCardsAction(FieldValue(13))
      ]
       action_index = Just4Fun.generate_action_mask_lookup_index(actions)
   
       for (index, action) in enumerate(actions)
         @test action_index[action] == index
       end
     end
  end
end
