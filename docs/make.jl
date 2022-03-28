using Documenter
using Pkg
Pkg.develop(path=joinpath(@__DIR__, ".."))
using WiSARD


# Set up to run docstrings with jldoctest
DocMeta.setdocmeta!(
    WiSARD, :DocTestSetup, :(using WiSARD); recursive=true
)

makedocs(;
    modules=[WiSARD],
    doctest=true,
    clean=true,
    format=Documenter.HTML(
        assets = ["assets/extra_styles.css", "assets/favicon.ico"],
        mathengine=Documenter.MathJax2(),
        sidebar_sitename=false,
    ), 
    sitename="WiSARD.jl",
    authors="Pedro Maciel Xavier",
    pages=[
        "Home" => "index.md",
        "manual.md",
        "examples.md",
    ],
    workdir="."
)

deploydocs(
    repo=raw"https://github.com/pedromxavier/WiSARD.jl.git",
    push_preview = true
)

Pkg.rm("WiSARD")