using Revise
using Printf
using PlotlyJS
#using Plots
#using PlotlyJS: plot, savefig

plotlyjs()

include("statistics.jl")


# Fields:
#  1  14  30  24  19   8
# 33  11   9  16  35  21
#  6  27  31  20   3  12
# 15  32   5  29  17  26
# 22  10  18  36  25   2
# 28   7  23   4  13  34
probas = [
    0.267296  0.469242  0.198726  0.332591   0.48386   0.450618 ;
    0.135348  0.548315  0.484489  0.477509   0.105489  0.405351 ;
    0.392418  0.266955  0.176339  0.419485   0.316426  0.578515 ;
    0.477425  0.149476  0.369026  0.22352    0.483325  0.285352 ;
    0.381964  0.512687  0.480878  0.0901938  0.306234  0.286839 ;
    0.243929  0.424994  0.361784  0.337987   0.46713   0.118147
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

ordered_probas = [
    0.27,
    0.29,
    0.32,
    0.34,
    0.37,
    0.39,
    0.42,
    0.45,
    0.48,
    0.51,
    0.55,
    0.58,
    0.47,
    0.47,
    0.48,
    0.48,
    0.48,
    0.48,
    0.48,
    0.42,
    0.41,
    0.38,
    0.36,
    0.33,
    0.31,
    0.29,
    0.27,
    0.24,
    0.22,
    0.20,
    0.18,
    0.15,
    0.14,
    0.12,
    0.11,
    0.09
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