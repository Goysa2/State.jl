# State.jl

This package provides types that tracks information for different types of
optimization problems. The information track can vary depending on the algorithm.
We can track for example the value of our point, the function evaluation, the
gradient, the representation of the hessian, etc.

This package stand on his own but is designed to work jointly with [Stopping.jl](https://github.com/Goysa2/Stopping.jl). Therefore more documentation on the usage of that package is provided in the documentation of [Stopping.jl](https://github.com/Goysa2/Stopping.jl).

So far we cover line search problems, unconstrained optimization problems and
non linear problems in general.
Tested with Julia 1.0+.
