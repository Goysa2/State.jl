module State

const Iterate           = Union{Number, Vector, Nothing}
const FloatVoid         = Union{Number, Nothing}
const MatrixType        = Any

export Iterate, FloatVoid, MatrixType

include("GenericResultmod.jl")
include("LSAtTmod.jl")
include("NLPAtXmod.jl")

export AbstractResult, GenericResult, update!
export LSAtT, copy, update!
export NLPAtX, update!

end # module
