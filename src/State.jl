module State

const Iterate           = Union{Float64,Vector,Void}
const FloatVoid         = Union{Float64,Void}
const MatrixType        = Any

export Iterate, FloatVoid, MatrixType

include("GenericResultmod.jl")
include("LSAtTmod.jl")
include("NLPAtXmod.jl")

export AbstractResult, GenericResult, update!
export LSAtT, copy, update!
export NLPAtX, update!

end # module
