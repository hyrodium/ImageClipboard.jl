using ImageClipboard
using Documenter

DocMeta.setdocmeta!(ImageClipboard, :DocTestSetup, :(using ImageClipboard); recursive=true)

makedocs(;
    modules=[ImageClipboard],
    authors="hyrodium <hyrodium@gmail.com> and contributors",
    repo="https://github.com/hyrodium/ImageClipboard.jl/blob/{commit}{path}#{line}",
    sitename="ImageClipboard.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://hyrodium.github.io/ImageClipboard.jl",
        assets=["assets/favicon.ico"],
    ),
    pages=[
        "Home" => "index.md",
        "Function Reference" => "functionreference.md",
    ],
)

deploydocs(;
    repo="github.com/hyrodium/ImageClipboard.jl",
)
