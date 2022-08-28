"""
parse_action_cards(cards_string::String)::Union{CardsAction, Nothing}

Prases card actions. Valid actions are space separated list of numbers and an empty input in case no cards can be played.
"""
function parse_action_cards(spec::Just4FunSpec, cards_string)::Union{CardsAction, Nothing}
    action_input = strip(cards_string)

    if action_input == "redraw"
        (cards=[], value=0)
    else
        max_field_value, _ = findmax(FIELD_VALUES)
        try
            played_cards = convert(Cards, [parse(UInt8, c) for c = split(action_input, CARD_ACTION_SEPARATOR)])
            sort!(played_cards)
            num_played_cards = length(played_cards)
            sum_played_cards = sum(played_cards)
            if 1 <= num_played_cards && num_played_cards <= SIZE_HAND && sum_played_cards <= max_field_value
                @show (cards=played_cards, value=sum_played_cards)
                return (cards=played_cards, value=sum_played_cards)
            else
                @warn "Invalid action played_cards=$(convert(Vector{Int64}, played_cards)), value=$(convert(Int64, sum_played_cards))"
                return nothing
            end
        catch error
            @warn "Failed to parse action!"
            nothing
        end
    end
end

function parse_action_cell_id(spec::Just4FunSpec, cell_string::String)::Union{Int64,Nothing}
    cell_id = parse(Int64, strip(cell_string))
    (0 < cell_id && cell_id <= length(FIELD_VALUES)) ? cell_id : nothing
end
