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

function reachable_fields(spec::Just4FunSpec, hand::Cards)::Vector{FieldValue}
    unique(
        map(
            comb -> FieldValue(sum(convert(Vector{Int64}, comb))),
            regular_combinations(
                spec,
                SVector{SIZE_HAND, CardValue}(hand)
            )
        )
    )
end