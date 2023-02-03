"""
  flip_colors(playerstones::SVector{Stones})::SVector{Stones}

Circular shift of the player's number of stones.
"""
function flip_colors(playerstones::SVector)::SVector
  return SVector{length(playerstones), Stones}(circshift(playerstones, -1))
end


"""
to_index(player::Player)::Int64

Returns the index of a player.
To be used as index in playercards and cell.
"""
to_index(player::Player)::Int64 = convert(Int64, player)

"""
shuffle(cards::Vector{Card})::Stack{CardValue}

Returns the vector of cards as a shuffled deck.
"""
function shuffle(cards::Vector{CardValue})::Stack{CardValue}
  shuffled_cards = Stack{CardValue}()
  for card in Random.shuffle(cards)
    push!(shuffled_cards, card)
  end
  shuffled_cards
end

#"""
#copy(stack::Stack{Card)
#
#Returns a copy of the stack.
#"""
function Base.copy(stack::Stack{CardValue})::Stack{CardValue}
  copy = Stack{CardValue}()
  for elem in Iterators.reverse(stack)
    push!(copy, elem)
  end
  copy
end

"""
all_sorted_card_combinations(deck_of_cards::Cards, size_of_hand::Int64)::Vector{Cards}

Returns all unique hands for the deck of cards.
"""
all_sorted_card_combinations(deck_of_cards::Cards, size_of_hand::Int64)::Vector{Cards} = unique([sort(c) for c = collect(powerset(deck_of_cards, 0, size_of_hand))])

"""
regular_combinations(field_values::SMatrix{SIDE_LENGTH, SIDE_LENGTH, FieldValue}, cards::Cards)::Vector{Cards}

Returns all valid sorted unique combinations for cards without the empty one.
"""
function regular_combinations(field_values::SMatrix{SIDE_LENGTH, SIDE_LENGTH, FieldValue}, cards::SVector{SIZE_HAND, CardValue})::Vector{Cards}
  max_field_value = max(SVector(field_values)...)
  rscc = unique([sort(c) for c = collect(powerset(cards, 1, length(cards)))])
  filter(cv -> sum(cv) <= max_field_value, rscc)
end

"""
regular_combinations(field_values::SMatrix{SIDE_LENGTH, SIDE_LENGTH, FieldValue}, cards::Vector{CardValue})::Vector{Cards}

Returns all valid sorted unique combinations for cards without the empty one.
"""
function regular_combinations(field_values::SMatrix{SIDE_LENGTH, SIDE_LENGTH, FieldValue}, cards::Vector{CardValue})::Vector{Cards}
  max_field_value = max(SVector(field_values)...)
  rscc = unique([sort(c) for c = collect(powerset(cards, 1, length(cards)))])
  filter(cv -> sum(cv) <= max_field_value, rscc)
end

"""
generate_card_actions(field_values::SVector{SIDE_LENGTH^2, FieldValue}, deck::Vector{CardValue}, size_hand::Int64)::Vector{CardsAction}

Generates the actions when stones and cards are used, i.e. vanilla just 4 fun. Only card combinations with sum >= 0 and sum <= max(field_value) are returned.
"""
function generate_card_actions(field_values::SVector{SIDE_LENGTH^2, FieldValue}, deck::Vector{CardValue}, size_hand::Int64)::Vector{CardsAction}
  max_field_value = max(field_values...)
  sorted_card_combinations = all_sorted_card_combinations(deck, size_hand)
  card_actions = map(scc -> (cards=scc, value=sum(scc)), sorted_card_combinations)
  filter(ca -> ca.value <= max_field_value, card_actions)
end

"""
generate_nocard_actions(field_values::SVector{SIDE_LENGTH^2, FieldValue})::Vector{NoCardsAction}

Generates the actions when only stones are used, i.e. normal distribution of values does not matter, only the number of stones.
"""
function generate_nocard_actions(field_values::SVector{SIDE_LENGTH^2, FieldValue})::Vector{NoCardsAction}
  convert(Vector{NoCardsAction}, sort(field_values))
end

"""
generate_action_mask_lookup_index(actions::Vector{CardsAction})::Dict{CardsAction, Int64}

Creates a map for fast lookup of card combinations to action mask index.
"""
function generate_action_mask_lookup_index(actions::Vector{CardsAction})::Dict{CardsAction, Int64}
  Dict([((cards=cards_action.cards, value=cards_action.value), idx) for (idx, cards_action) = enumerate(actions)])
end

"""
generate_action_mask_lookup_index(actions::Vector{NoCardsAction})::Dict{NoCardsAction, Int64}

Creates a map for fast lookup of actions to action mask index.
"""
function generate_action_mask_lookup_index(actions::Vector{NoCardsAction})::Dict{NoCardsAction, Int64}
  Dict([(field_value, idx) for (idx, field_value)  = enumerate(actions)])
end