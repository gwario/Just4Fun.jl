using Just4Fun
using Just4Fun: regular_combinations
using Random
using StatsBase
using StatsBase: seqsample_a!
using StaticArrays

function get_random_hand(spec::Just4FunSpec)::Cards
    random_hand = Vector{Int64}(undef, spec.settings.cards.size_hand)
    seqsample_a!(spec.settings.cards.deck, random_hand)
    return random_hand
end

reachable_fields(spec::Just4FunSpec, hand::Cards)::Vector{FieldValue} = map(
    comb -> FieldValue(sum(convert(Vector{Int64}, comb))),
    regular_combinations(spec, SVector{spec.settings.cards.size_hand,CardValue}(hand)),
)

function print_dist(stats, spec, n_samples, in_pct=true)
    by_value = sort(collect(stats), by=pair -> pair[1])
    by_proba = sort(collect(stats), by=pair -> pair[2], rev=true)
    println("<Field value>: <probability>$(in_pct ? "[%]" : "")")
    for ((key1, value1), (key2, value2)) in zip(by_value, by_proba)
        @printf("%+2s: %4.02f   |   %+2s: %4.02f\n", key1, (in_pct ? 100 : 1) * value1 / n_samples, key2, (in_pct ? 100 : 1) * value2 / n_samples)
    end
    println()
    println("#"^8)
    println()
    println("Mapped to the board $(in_pct ? "[%]" : ""):")
    mapped = zeros(size(spec.settings.board.value_distribution))
    for (i,v) in enumerate(spec.settings.board.value_distribution)
        mapped[i] = stats[v]
    end
    mapped = (in_pct ? 100 : 1) * mapped ./ n_samples
    display(mapped)
end