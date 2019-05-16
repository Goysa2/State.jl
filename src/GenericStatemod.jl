################################################################################
# This is the Generic implementation of an AbstractResult. More documentation
# can be found on the specific types and the README.
################################################################################
abstract type AbstractState end

mutable struct GenericState <: AbstractState

	x :: Iterate

	function GenericState(x :: Iterate;
					      kwargs...)
		return new(x)
	end
end

function update!(stateatx :: AbstractState)
 return throw(error("NotImplemented function"))
end
