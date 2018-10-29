################################################################################
# This is the Generic implementation of an AbstractResult. More documentation
# can be found on the specific types and the README.
################################################################################
abstract type AbstractResult end

const Iterate           = Union{Float64,Vector,Void}

mutable struct GenericResult <: AbstractResult

	x :: Iterate

	function GenericResult(x :: Iterate;
					       kwargs...)
		return new(x)
	end
end

function update!(resultatx :: AbstractResult)
 return throw(error("NotImplemented function"))
end
