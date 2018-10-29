# module NLPAtXmod

# import GenericResultmod: AbstractResult, update!

# export NLPAtX, update!

# const Iterate           = Union{Float64,Vector,Void}
# const FloatVoid         = Union{Float64,Void}
# const MatrixType        = Any
# const HessType          = Union{Float64,Array}

################################################################################
# TODO: add constraints
################################################################################

"""
NLPAtX contains the important information concerning a non linear problem at
the iteration x. Basic information is:
 - x the current candidate for solution to our original problem
 - dx is the last step from the algorithm (x^{k+1}-x^k)
 - f(x) which is the funciton evaluation at x
 - df is f(x^{k+1}) - f(x^k)
 - g(x) which is the gradient evaluation at x
 - g(0) which is the funciton evaluation at x0 (our starting point)
 - Hx which is the hessian representation at x

 All these information (except for x) are optionnal and need to be update when
 required. The update is done trhough the update! function.
"""
type 	NLPAtX <: AbstractResult

#Unconstrained State
	x  		     :: Iterate		# current point
    dx           :: Iterate
	fx 		     :: FloatVoid		# objective function
    df           :: FloatVoid
	gx 		     :: Iterate		# gradient
	g0           :: Iterate
    Hx           :: MatrixType  # a priori ça doit être une fonction pour Newton... à voir...

#Bounds states
    mu           :: Iterate #Lagrange multipliers with bounds

#Constrainted state
    cx           :: Iterate #vector of constraints lc <= c(x) <= uc
    Jx           :: MatrixType #jacobian matrix
    lambda       :: Iterate #Lagrange multipliers

    start_time   :: FloatVoid

 function NLPAtX( x          :: Iterate,
                  lambda     :: Iterate;
                  dx         :: Iterate      = NaN*ones(x),
                  fx         :: FloatVoid    = NaN,
                  df         :: FloatVoid    = NaN,
                  gx         :: Iterate      = NaN*ones(x),
				  g0         :: Iterate      = NaN*ones(x),
                  Hx         :: MatrixType   = zeros(0,0),
                  mu         :: Iterate      = NaN*ones(x),
                  cx         :: Iterate      = NaN*ones(lambda),
                  Jx         :: MatrixType   = zeros(length(x),length(lambda)),
                  start_time :: FloatVoid    = NaN)

  return new(x, dx, fx, df, gx, g0, Hx, mu, cx, Jx, lambda, start_time)
 end
end

"""
An additional constructor for unconstrained problems
"""
function NLPAtX(x          :: Iterate;
                dx         :: Iterate      = NaN*ones(x),
                fx         :: FloatVoid    = NaN,
                df         :: FloatVoid    = NaN,
                gx         :: Iterate      = NaN*ones(x),
                g0         :: Iterate      = NaN*ones(x),
                Hx         :: MatrixType   = zeros(0,0),
                start_time :: FloatVoid    = NaN)

	return NLPAtX(x, zeros(0), dx = dx, fx = fx, df = df,
                  gx = gx, g0 = g0,
                  Hx = Hx, start_time = start_time)
end

"""Updates the (desired) values of an object of type NLPAtX."""
function update!(nlpatx :: NLPAtX;
	             x      :: Iterate    = nothing,
				 fx     :: FloatVoid  = nothing,
				 gx     :: Iterate    = nothing,
				 g0     :: Iterate    = nothing,
				 Hx     :: MatrixType = nothing,
                 mu     :: Iterate    = nothing,
                 cx     :: Iterate    = nothing,
                 Jx     :: MatrixType = nothing,
                 lambda :: Iterate    = nothing,
				 tmps   :: FloatVoid  = nothing)
	if x != nothing
    	nlpatx.dx  = x - nlpatx.x
     	nlpatx.x   = x
 	end
 	if fx != nothing
    	nlpatx.df   = fx - nlpatx.fx
     	nlpatx.fx   =  fx
 	end

 	nlpatx.gx  = gx == nothing  ? nlpatx.gx  : gx
 	nlpatx.g0  = g0 == nothing  ? nlpatx.g0  : g0
 	nlpatx.Hx  = Hx == nothing  ? nlpatx.Hx  : Hx
 	nlpatx.mu  = mu == nothing  ? nlpatx.mu  : mu
 	nlpatx.cx  = cx == nothing  ? nlpatx.cx  : cx
 	nlpatx.Jx  = Jx == nothing  ? nlpatx.Jx  : Jx
 	nlpatx.lambda  = lambda == nothing  ? nlpatx.lambda  : lambda

 	nlpatx.start_time = tmps == nothing ? nlpatx.start_time : tmps

  	return nlpatx
end

#end of module
# end
