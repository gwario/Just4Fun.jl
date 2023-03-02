using Revise
using Printf
using Plots
using PlotlyJS: plot, savefig

plotlyjs()

include("statistics.jl")
# MINI_JUST4FUN
#eld Probability Distribution:
# 5: 0.87
# 9: 0.82
# 8: 0.81
# 7: 0.79
# 4: 0.79
# 6: 0.76
#10: 0.74
# 3: 0.71
#11: 0.65
# 2: 0.62
#12: 0.58
# 1: 0.54
#13: 0.51
#14: 0.43
#15: 0.33
#16: 0.26
#Field Probability Distribution:
# 1: 0.54
# 2: 0.62
# 3: 0.71
# 4: 0.79
# 5: 0.87
# 6: 0.76
# 7: 0.79
# 8: 0.81
# 9: 0.82
#10: 0.74
#11: 0.65
#12: 0.58
#13: 0.51
#14: 0.43
#15: 0.33
#16: 0.26
#4×4 Matrix{Float64}:
# 0.869246  0.708362  0.759938  0.331556
# 0.649476  0.514141  0.820149  0.544312
# 0.427386  0.618023  0.582679  0.790006
# 0.789095  0.814536  0.264685  0.735307
#
#
# JUST4FUN
# Fields:
#  1  14  30  24  19   8
# 33  11   9  16  35  21
#  6  27  31  20   3  12
# 15  32   5  29  17  26
# 22  10  18  36  25   2
# 28   7  23   4  13  34
# MINI_JUST4FUN
# Fields:
#  5  3  6 15
# 11 13  9  1
# 14  2 12  7
#  4  8 16 10
probas = [
    0.869246  0.708362  0.759938  0.331556 ;
    0.649476  0.514141  0.820149  0.544312 ;
    0.427386  0.618023  0.582679  0.790006 ;
    0.789095  0.814536  0.264685  0.735307
]

probas = probas .* 100

# because the heatmap is created from bottom left
probas = reverse(probas, dims = 1)

p = PlotlyJS.plot(
    PlotlyJS.heatmap(
        #probas, # works
        #x=["$i" for i in 1:size(probas)[2]],
        #y=["$i" for i in 1:size(probas)[1]],
        z=probas,# works with PlotlyJS. !!!!!
        #show=true,
        coloraxis="coloraxis",
        #width=300,
        #height=300,
        #text=:z
        #labels=vec(Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST),
        #text=vec(Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST),
        #text=vec(weights[:, :, plane_idx, filter_idx]),
        #texttemplate="%{z}",
        #mode="markers+text+lines",
        #textposition="center center",
        #hovertemplate="%{z}"
    )
)

PlotlyJS.relayout!(
    p;
    #coloraxis_colorscale="Viridis", coloraxis_reversescale=true,
    #coloraxis_colorscale="Blues", coloraxis_reversescale=true,
    #coloraxis_colorscale="Cividis", coloraxis_reversescale=true,
    #coloraxis_colorscale="Greens", coloraxis_reversescale=true,
    #coloraxis_colorscale="Reds",
    coloraxis_colorscale="YlGnBu", coloraxis_reversescale=true,
    #coloraxis_colorscale="YlOrRd", coloraxis_reversescale=true,
    #mode="markers+text+lines",
    #z_texttemplate="%{z}xcvxcv",
    #texttemplate="%{z}xcvxcv",
    #textposition="center center",
    #text=map(x -> "$x", Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST),
    #zaxis_annotations=[
    #    #text("$(Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST[i])")
    #    attr(x=i[2], y=i[1], text=text(Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST[i]))
    #    for i in eachindex(CartesianIndices(probas))
    #]
)

#annotate!(["$(Just4Fun.JUST4FUN_DEFAULT_ORIGINAL_DIST[i])" for i in 1:36])

file_name =joinpath(".", "field-probability-dist.svg")
PlotlyJS.savefig(p, file_name)
@info "Saved plot as $file_name"

# JUST4FUN
# Orders proba
#1: 0.27
#2: 0.29
#3: 0.32
#4: 0.34
#5: 0.37
#6: 0.39
#7: 0.42
#8: 0.45
#9: 0.48
#10: 0.51
#11: 0.55
#12: 0.58
#13: 0.47
#14: 0.47
#15: 0.48
#16: 0.48
#17: 0.48
#18: 0.48
#19: 0.48
#20: 0.42
#21: 0.41
#22: 0.38
#23: 0.36
#24: 0.33
#25: 0.31
#26: 0.29
#27: 0.27
#28: 0.24
#29: 0.22
#30: 0.20
#31: 0.18
#32: 0.15
#33: 0.14
#34: 0.12
#35: 0.11
#36: 0.09

# MINI_JUST4FUN
#Field Probability Distribution:
# 1: 0.54
# 2: 0.62
# 3: 0.71
# 4: 0.79
# 5: 0.87
# 6: 0.76
# 7: 0.79
# 8: 0.81
# 9: 0.82
#10: 0.74
#11: 0.65
#12: 0.58
#13: 0.51
#14: 0.43
#15: 0.33
#16: 0.26

ordered_probas = [
    0.54,
    0.62,
    0.71,
    0.79,
    0.87,
    0.76,
    0.79,
    0.81,
    0.82,
    0.74,
    0.65,
    0.58,
    0.51,
    0.43,
    0.33,
    0.26
]

p = PlotlyJS.plot(
    PlotlyJS.bar(
        x=eachindex(ordered_probas),
        y=ordered_probas .* 100,
        name="Field probability",
    )
)

PlotlyJS.relayout!(
    p;
    xaxis_dtick=1,
    #annotations=[
    #    attr(x=1, y=1, text="text")
    #    for _ in 1:36
    #]
)

file_name =joinpath(".", "field-probability-dist_lines.svg")
PlotlyJS.savefig(p, file_name)
@info "Saved plot as $file_name"