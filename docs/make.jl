using Documenter, State
makedocs(modules = [State],
		 doctest = true,
		 format = Documenter.HTML(assets = ["assets/style.css"], prettyurls = get(ENV, "CI", nothing) == "true"),
		 sitename = "State.jl")

deploydocs(repo = "github.com/Goysa2/State.jl.git")
