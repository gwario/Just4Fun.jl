to_field_value(action::NoCardsAction) = action
to_field_value(action::CardsAction) = action.value

to_cards(action::CardsAction) = action.cards

to_int_field_value(action::NoCardsAction) = Int64(action)
to_int_field_value(action::CardsAction) = Int64(action.value)
to_int_cards(action::CardsAction) = convert(Vector{Int64}, action.cards)

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
regular_combinations(spec::Just4FunSpec, cards::AbstractVector{CardValue})::Vector{Cards}

Returns all valid sorted unique combinations for cards without the empty one.
"""
function regular_combinations(spec::Just4FunSpec, cards::AbstractVector{CardValue})::Vector{Cards}
  max_field_value = max(spec.settings.board.value_distribution...)
  rscc = unique([sort(c) for c = collect(powerset(cards, 1, length(cards)))])
  filter(cv -> 0 < sum(cv) <= max_field_value, rscc)
end

function generate_card_actions(settings::Just4FunSettings)::Vector{CardsAction}
  max_field_value = max(vec(settings.board.value_distribution)...)
  sorted_card_combinations = all_sorted_card_combinations(convert(Cards, sort(settings.cards.deck)), settings.cards.size_hand)
  card_actions::Vector{CardsAction} = map(scc -> CardsAction((cards=scc, value=sum(scc))), sorted_card_combinations)
  valid_card_actions = filter(ca -> 0 < ca.value <= max_field_value, card_actions)
  valid_card_actions = vcat([REDRAW_ACTION], valid_card_actions)
  sort(valid_card_actions, by=to_field_value)
end

function generate_nocard_actions(settings::Just4FunSettings)::Vector{NoCardsAction}
  convert(Vector{NoCardsAction}, sort(vec(settings.board.value_distribution)))
end

"""
generate_action_mask_lookup_index(actions::Vector{CardsAction})::Dict{Action, Int64}

Creates a map for fast lookup of card combinations to action mask index.
"""
function generate_action_mask_lookup_index(actions::Vector{CardsAction})::Dict{Action, Int64}
  Dict{Action, Int64}([
    ((cards=cards_action.cards, value=cards_action.value), idx)
    for (idx, cards_action) = enumerate(actions)
  ])
end

"""
generate_action_mask_lookup_index(actions::Vector{NoCardsAction})::Dict{Action, Int64}

Creates a map for fast lookup of actions to action mask index.
"""
function generate_action_mask_lookup_index(actions::Vector{NoCardsAction})::Dict{Action, Int64}
  Dict{Action, Int64}([
    (field_value, idx)
    for (idx, field_value)  = enumerate(actions)
  ])
end