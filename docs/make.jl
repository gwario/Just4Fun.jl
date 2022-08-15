using Just4Fun
using Documenter

DocMeta.setdocmeta!(Just4Fun, :DocTestSetup, :(using Just4Fun); recursive=true)

makedocs(;
    modules=[Just4Fun],
    authors="Mario Gastegger <mario.gastegger@gmail.com>",
    repo="https://gitlab.com/gwario/Just4Fun.jl/blob/{commit}{path}#{line}",
    sitename="Just4Fun.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://gwario.gitlab.io/Just4Fun.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)
