module State

const Iterate           = Union{BigFloat, Float64, Vector, Nothing, Float16, Float32}
const FloatVoid         = Union{BigFloat, Float64, Nothing, Float16, Float32}
const FloatBigFloat		= Union{BigFloat, Float64, Float16, Float32}
const MatrixType        = Any

export Iterate, FloatVoid, MatrixType, FloatBigFloat

include("GenericResultmod.jl")
include("LSAtTmod.jl")
include("NLPAtXmod.jl")

export AbstractResult, GenericResult, update!
export LSAtT, copy, update!
export NLPAtX, update!

end # module
