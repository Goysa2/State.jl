import Base.copy

"""
A structure designed to track line search information from one iteration to
another. If we have f : ℜⁿ → ℜ, then we define h(θ) = f(x + θ*d) where x and d
are vectors of same dimension and θ is a scalar, more specifically our step size.

Tracked data can include:
 	- x : our current step size
	- dx : the different between our current step stize and the previous one
	- ht : h(θ) at the current iteration
	- df : the difference between the current h(θ) and the previous one
	- gt : h'(θ)
	- h₀ : h(0)
	- g₀ : h'(0)
	- start_time: the time at which the line search algorithm started.

Unless they are defined otherwise, the default value for all parameter is NaN
(except for x). They can be updated through the update! function.

Example:
ls_a_t = LSAtT(1.0)
update!(ls_a_t, x = 0.0, h₀ = obj(h, 0.0), g₀ = grad(h, 0.0))
"""
mutable struct 	LSAtT <: AbstractState

	x  		     :: Number	#
	dx           :: Number     #
	ht 		     :: Number		# h(θ)
	df           :: Number
	gt 		     :: Number		# h'(θ)
	h₀         	 :: Number		# h(0)
	g₀ 		     :: Number		# h'(0)

	start_time :: Number

 function LSAtT(t          :: Number;
	            dx         :: Number = NaN,
                ht         :: Number = NaN,
				df         :: Number = NaN,
                gt         :: Number = NaN,
                h₀         :: Number = NaN,
                g₀         :: Number = NaN,
                start_time :: Number = NaN)

  return new(t, dx, ht, df, gt, h₀, g₀, start_time)
 end
end

function update!(ls_at_t :: LSAtT;
 	              x       :: FloatVoid = nothing,
				  dx      :: FloatVoid = nothing,
 				  ht      :: FloatVoid = nothing,
				  df      :: FloatVoid = nothing,
 	              gt      :: FloatVoid = nothing,
 	              h₀      :: FloatVoid = nothing,
 	              g₀      :: FloatVoid = nothing,
 	              tmps    :: FloatVoid = nothing,
                  kwargs...)

	if x != nothing && dx == nothing
		ls_at_t.dx = x - ls_at_t.x
	elseif dx != nothing
    	ls_at_t.dx = dx
  	else
		ls_at_t.dx = ls_at_t.dx
  	end
  	if x != nothing
	  	ls_at_t.x  = x
  	end

  	if ht != nothing && df == nothing
    	ls_at_t.df = ht - ls_at_t.ht
	elseif df != nothing
    	ls_at_t.df = df
  	else
		ls_at_t.dx = ls_at_t.dx
  	end
  	if ht != nothing
	  	ls_at_t.ht = ht
  	end

  	ls_at_t.gt = gt == nothing ? ls_at_t.gt : gt
  	ls_at_t.h₀ = h₀ == nothing ? ls_at_t.h₀ : h₀
  	ls_at_t.g₀ = g₀ == nothing ? ls_at_t.g₀ : g₀

  	ls_at_t.start_time = tmps == nothing ? ls_at_t.start_time : tmps

   	return ls_at_t
end

function copy(ls_at_t :: LSAtT)
	return LSAtT(copy(ls_at_t.x),
               	 dx = copy(ls_at_t.dx),
                 ht = copy(ls_at_t.ht),
			     df = copy(ls_at_t.df),
                 gt = copy(ls_at_t.gt),
                 h₀ = copy(ls_at_t.h₀),
                 g₀ = copy(ls_at_t.g₀),
                 start_time = copy(ls_at_t.start_time))
end

function convert_ls(T, ls_at_t :: LSAtT)
	ls_a_t_T        = LSAtT(T.(copy(ls_at_t.x)))

	ls_a_t_T.dx = typeof(ls_at_t.x)  != Nothing ? convert.(T, ls_at_t.x)  : ls_at_t.dx
	ls_a_t_T.ht = typeof(ls_at_t.ht) != Nothing ? convert.(T, ls_at_t.ht) : ls_at_t.ht
	ls_a_t_T.df = typeof(ls_at_t.df) != Nothing ? convert.(T, ls_at_t.df) : ls_at_t.df
	ls_a_t_T.gt = typeof(ls_at_t.gt) != Nothing ? convert.(T, ls_at_t.gt) : ls_at_t.gt
	ls_a_t_T.h₀ = typeof(ls_at_t.h₀) != Nothing ? convert.(T, ls_at_t.h₀) : ls_at_t.h₀
	ls_a_t_T.g₀ = typeof(ls_at_t.g₀) != Nothing ? convert.(T, ls_at_t.g₀) : ls_at_t.g₀

	return ls_a_t_T
end
