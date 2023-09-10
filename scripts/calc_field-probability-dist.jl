using Revise
using Printf

include("statistics.jl")

const N_SAMPLES = 1_000_000_000
#const N_SAMPLES = 1_000_000
const IN_PERCENT = true
stats = Dict{FieldValue, Int64}()
fields_hands = Vector{Int64}()
unique_stats = Dict{FieldValue, Int64}()
unique_fields_hands = Vector{Int64}()

n_fields = 0
n_unique_fields = 0

spec = Just4Fun.j4f_spec

for _ in 1:N_SAMPLES
    hand = get_random_hand(spec)

    fields = reachable_fields(spec, hand)
    
    push!(fields_hands, length(fields))
    for field in fields
        stats[field] = get(stats, field, 0) + 1
    end

    unique_fields = unique(fields)
    push!(unique_fields_hands, length(unique_fields))
    for field in unique_fields
        unique_stats[field] = get(unique_stats, field, 0) + 1
    end
    global n_fields += length(fields)
    global n_unique_fields += length(unique_fields)
end

println("Field Probability Distribution:")
print_dist(stats, spec, N_SAMPLES)
println()
println("Average Fields per Random Hand:")
@printf("%4.4f ±%4.04f\n", mean(fields_hands), std(fields_hands))
println()
println("—"^60)
println()
println("Unique Field Probability Distribution:")
print_dist(stats, spec, N_SAMPLES)
println()
println("Average Unique Fields per Random Hand:")
@printf("%4.4f ±%4.04f\n", mean(unique_fields_hands), std(unique_fields_hands))
println()
println("—"^60)
println()
println("Overall fields: $n_fields")
println("Unique fields: $n_unique_fields")
n_duplicate_fields = n_fields - n_unique_fields
@printf("Duplicate fields: %d (%4.2f%s) relative to unique fields)\n", n_duplicate_fields, (IN_PERCENT ? 100 : 1) * n_duplicate_fields / n_unique_fields, IN_PERCENT ? "%" : "")