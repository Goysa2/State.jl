module State

const Iterate           = Union{Number, Vector, Nothing}
const FloatVoid         = Union{Number, Nothing}
const MatrixType        = Any #Union{Number, AbstractArray, Nothing}

include("GenericStatemod.jl")
include("LSAtTmod.jl")
include("NLPAtXmod.jl")

export AbstractState, GenericState, update!
export LSAtT, copy, update!
export NLPAtX, update!, convert_nlp, convert_ls

end # module
