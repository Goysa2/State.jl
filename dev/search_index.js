var documenterSearchIndex = {"docs":
[{"location":"api/#Types-1","page":"API","title":"Types","text":"","category":"section"},{"location":"api/#","page":"API","title":"API","text":"State.NLPAtX\nState.LSAtT","category":"page"},{"location":"api/#State.NLPAtX","page":"API","title":"State.NLPAtX","text":"NLPAtX contains the important information concerning a non linear problem at the iteration x. Basic information is:\n\nx the current candidate for solution to our original problem\nf(x) which is the funciton evaluation at x\ng(x) which is the gradient evaluation at x\nHx which is the hessian representation at x\nmu : Lagrange multiplier of the bounds constraints\ncx : evaluation of the constraint function at x\nJx : jacobian matrix of the constraint function at x\nlambda : Lagrange multiplier of the constraints\nstart_time : Default is a NaN, can be updated to fit the start of the algorithm.\nevals : number of evaluations of the function (import the type NLPModels.Counters)\n\nAll these information (except for x) are optionnal and need to be update when  required. The update is done trhough the update! function.\n\n\n\n\n\n","category":"type"},{"location":"api/#State.LSAtT","page":"API","title":"State.LSAtT","text":"A structure designed to track line search information from one iteration to another. If we have f : ℜⁿ → ℜ, then we define h(θ) = f(x + θ*d) where x and d are vectors of same dimension and θ is a scalar, more specifically our step size.\n\nTracked data can include:\n\nx : our current step size\nht : h(θ) at the current iteration\ngt : h'(θ)\nh₀ : h(0)\ng₀ : h'(0)\nstart_time: the time at which the line search algorithm started.\n\nUnless they are defined otherwise, the default value for all parameter is NaN (except for x). They can be updated through the update! function.\n\nExample:\n\nls_a_t = LSAtT(1.0)\nupdate!(ls_a_t, x = 0.0, h₀ = obj(h, 0.0), g₀ = grad(h, 0.0))\n\n\n\n\n\n","category":"type"},{"location":"api/#Function-1","page":"API","title":"Function","text":"","category":"section"},{"location":"api/#","page":"API","title":"API","text":"State.update!","category":"page"},{"location":"api/#State.update!","page":"API","title":"State.update!","text":"Updates the (desired) values of an object of type NLPAtX. Inputs:\n\nAn NLPAtX object\nAny keywords that needs to be updated.\n\n\n\n\n\n","category":"function"},{"location":"#State.jl-1","page":"Home","title":"State.jl","text":"","category":"section"},{"location":"#","page":"Home","title":"Home","text":"This package provides types that tracks information for different types of optimization problems. The information track can vary depending on the algorithm. We can track for example the value of our point, the function evaluation, the gradient, the representation of the hessian, etc.","category":"page"},{"location":"#","page":"Home","title":"Home","text":"This package stand on his own but is designed to work jointly with Stopping.jl. Therefore more documentation on the usage of that package is provided in the documentation of Stopping.jl.","category":"page"},{"location":"#","page":"Home","title":"Home","text":"So far we cover line search problems, unconstrained optimization problems and non linear problems in general. Tested with Julia 1.0+.","category":"page"}]
}
