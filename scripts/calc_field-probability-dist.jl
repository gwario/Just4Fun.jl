using Revise
using Printf

include("statistics.jl")

const N_SAMPLES = 1_000_000_000

stats = Dict{FieldValue, Int64}()


for _ in 1:N_SAMPLES
    hand = get_random_hand(Just4Fun.JUST4FUN_DEFAULT_SIZE_HAND, Just4Fun.JUST4FUN_DEFAULT_DECK)

    fields = reachable_fields(vec(Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST), hand)
    
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

mapped = zeros(size(Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST))

for (i,v) in enumerate(Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST)
    mapped[i] = stats[v]
end

mapped = mapped ./ N_SAMPLES
