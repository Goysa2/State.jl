using Documenter
using State

makedocs(
    sitename = "State",
    format = Documenter.HTML(),
    modules = [State]
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
deploydocs(    repo = "github.com/Goysa2/State.jl")#
