using Documenter, State
makedocs(modules = [State],
		 doctest = true,
		 format = Documenter.HTML(assets = ["assets/style.css"], prettyurls = get(ENV, "CI", nothing) == "true"),
		 sitename = "State.jl")

deploydocs(deps = nothing, make = nothing,
		   repo = "github.com/Goysa2/State.jl.git",
		   target = "build",
		   devbranch = "master"
           )
