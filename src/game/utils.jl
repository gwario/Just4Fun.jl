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
    return SVector{length(playerstones),Stones}(circshift(playerstones, -1))
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
regular_combinations(spec::Just4FunSpec, cards::AbstractVector{CardValue})::Vector{Cards}

Returns all valid sorted unique combinations for cards without the empty one.
"""
function regular_combinations(spec::Just4FunSpec, cards::AbstractVector{CardValue})::Vector{Cards}
    max_field_value = max(spec.settings.board.value_distribution...)
    unique(Iterators.map(sort, Iterators.filter(cv -> 0 < sum(cv) <= max_field_value, powerset(cards, 1, length(cards)))))
end

"""
cards_combinations(spec::Just4FunSpec, field::FieldValue, cards::AbstractVector{CardValue})::Vector{Cards}

Returns all valid sorted unique combinations for cards without the empty one.
"""
function cards_combinations(spec::Just4FunSpec, field::FieldValue, cards::AbstractVector{CardValue})::Vector{Cards}
    unique(Iterators.map(sort, Iterators.filter(cvs -> sum(cvs) == field, powerset(cards, 1, spec.settings.cards.size_hand))))
end

generate_board_actions(settings::Just4FunSettings)::Vector{NoCardsAction} = convert(Vector{NoCardsAction}, sort(vec(settings.board.value_distribution)))
