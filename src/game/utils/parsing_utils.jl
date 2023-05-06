"""
parse_action_cards(cards_string::String)::Union{CardsAction, Nothing}

Prases card actions. Valid actions are space separated list of numbers and an empty input in case no cards can be played.
"""
function parse_action_cards(spec::Just4FunSpec, cards_string)::Union{CardsAction, Nothing}
    action_input = strip(cards_string)

    max_field_value, _ = findmax(spec.settings.board.value_distribution)
    try
        played_cards = convert(Cards, [parse(UInt8, c) for c = split(action_input, CARD_ACTION_SEPARATOR)])
        sort!(played_cards)
        num_played_cards = length(played_cards)
        sum_played_cards = sum(played_cards)
        if 1 <= num_played_cards && num_played_cards <= spec.settings.cards.size_hand && sum_played_cards <= max_field_value
            return (cards=played_cards, value=sum_played_cards)
        else
            @warn "Invalid action played_cards=$(convert(Vector{Int64}, played_cards)), value=$(convert(Int64, sum_played_cards))"
            return nothing
        end
    catch error
        @warn "Failed to parse action!"
        return nothing
    end
end

function parse_action_cell_id(spec::Just4FunSpec, cell_string::String)::Union{NoCardsAction,Nothing}
    try
        cell_id = parse(FieldValue, strip(cell_string))
        if 0 < cell_id && cell_id <= length(spec.settings.board.value_distribution)
            return cell_id
        else
            @warn "Invalid action cell_id=$cell_id"
            return nothing
        end
    catch error
        @warn "Failed to parse action!"
        return nothing
    end    
end
