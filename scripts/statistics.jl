using Just4Fun
using Just4Fun: regular_combinations
using Random
using StatsBase: seqsample_a!
using StaticArrays

function get_random_hand(hand_size::Int64, deck::Vector{Int64})::Cards
    random_hand = Vector{Int64}(undef, hand_size)
    seqsample_a!(deck, random_hand)
    return random_hand
end

function reachable_fields(field_values::Vector{Int64}, hand::Cards)::Vector{FieldValue}
    unique(
        map(
            comb -> FieldValue(sum(convert(Vector{Int64}, comb))),
            regular_combinations(
                SMatrix{SIDE_LENGTH, SIDE_LENGTH, FieldValue}(field_values),
                SVector{SIZE_HAND, CardValue}(hand)
            )
        )
    )
end