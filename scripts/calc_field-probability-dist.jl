using Revise
using Printf

include("statistics.jl")

const N_SAMPLES = 1_000_000 #1_000_000_000

stats = Dict{FieldValue, Int64}()

spec = Just4Fun.mini_j4f_spec

for _ in 1:N_SAMPLES
    hand = get_random_hand(spec.settings.cards.size_hand, spec.settings.cards.deck)

    fields = reachable_fields(vec(spec.settings.board.value_distribution), hand)
    
    for field in fields
        stats[field] = get(stats, field, 0) + 1
    end
end

println("Field Probability Distribution:")
for (key, value) in sort(collect(stats), by=pair -> pair[2], rev=true)
    @printf("%+2s: %4.2f\n", key, value / N_SAMPLES)
end
println()
println()
println()
println("Field Probability Distribution:")
for (key, value) in sort(collect(stats), by=pair -> pair[1])
    @printf("%+2s: %4.2f\n", key, value / N_SAMPLES)
end

mapped = zeros(spec.settings.board.dimensions)

for (i,v) in enumerate(spec.settings.board.value_distribution)
    mapped[i] = stats[v]
end

mapped = mapped ./ N_SAMPLES
