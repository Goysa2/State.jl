################################################################################
# This is the Generic implementation of an AbstractResult. More documentation
# can be found on the specific types and the README.
################################################################################
abstract type AbstractResult end

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
