using Documenter
using State

makedocs(
    sitename = "State.jl",
    format = Documenter.HTML(assets = ["assets/style.css"], prettyurls = get(ENV, "CI", nothing) == "true"),
    modules = [State],
    doctest = true,
    linkcheck = true,
    strict = true
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
deploydocs(repo = "github.com/Goysa2/State.jl", devbranch = "test-doc")#
