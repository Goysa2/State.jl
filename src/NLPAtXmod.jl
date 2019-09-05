"""
NLPAtX contains the important information concerning a non linear problem at
the iteration x. Basic information is:
 - x the current candidate for solution to our original problem
 - f(x) which is the funciton evaluation at x
 - g(x) which is the gradient evaluation at x
 - g(0) which is the funciton evaluation at x0 (our starting point)
 - Hx which is the hessian representation at x

 All these information (except for x) are optionnal and need to be update when
 required. The update is done trhough the update! function.
"""
mutable struct 	NLPAtX <: AbstractState

#Unconstrained State
	x  	     :: Iterate		# current point
	fx 	     :: FloatVoid	# objective function
	gx           :: Iterate		# gradient
	g0           :: Iterate
        Hx           :: MatrixType  	# Accurate?

#Bounds State
    	mu           :: Iterate     	#Lagrange multipliers with bounds

#Constrained State
    	cx           :: Iterate 	# vector of constraints lc <= c(x) <= uc
    	Jx           :: MatrixType 	# jacobian matrix
    	lambda       :: Iterate 	# Lagrange multipliers

    	start_time   :: FloatVoid

 function NLPAtX(x          :: Iterate,
                 lambda     :: Iterate;
                 fx         :: FloatVoid    = NaN,
                 gx         :: Iterate      = NaN * fill(1.0, size(x)),
		 g0         :: Iterate      = NaN * fill(1.0, size(x)),
                 Hx         :: MatrixType   = zeros(0,0),
                 mu         :: Iterate      = NaN * fill(1.0, size(x)),
                 cx         :: Iterate      = NaN * fill(1, size(lambda)),
                 Jx         :: MatrixType   = zeros(length(x),length(lambda)),
                 start_time :: FloatVoid    = NaN)

  return new(x, fx, gx, g0, Hx, mu, cx, Jx, lambda, start_time)
 end
end

"""
An additional constructor for unconstrained problems
"""
function NLPAtX(x          :: Iterate;
                fx         :: FloatVoid    = NaN,
                gx         :: Iterate      = NaN * fill(1.0, size(x)),
                g0         :: Iterate      = NaN * fill(1.0, size(x)),
                Hx         :: MatrixType   = zeros(0,0),
                start_time :: FloatVoid    = NaN)

	return NLPAtX(x, zeros(0), fx = fx, gx = gx, g0 = g0,
                  Hx = Hx, start_time = start_time)
end

"""
Updates the (desired) values of an object of type NLPAtX.
"""
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
     	 nlpatx.x   = x
 	end
	
 	if fx != nothing
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

"""
convert_nlp:
TO DO
"""
function convert_nlp(T,  nlpatx :: NLPAtX)
	
	nlpatxT         	= NLPAtX(zeros(T, length(nlpatx.x)))
	nlpatxT.x  		= typeof(nlpatx.x)      != Nothing ? convert.(T, nlpatx.x) 	: nlpatx.x
	nlpatxT.fx 		= typeof(nlpatx.fx)     != Nothing ? convert.(T, nlpatx.fx) 	: nlpatx.fx
	nlpatxT.gx 		= typeof(nlpatx.gx)     != Nothing ? convert.(T, nlpatx.gx) 	: nlpatx.gx
	nlpatxT.g0 		= typeof(nlpatx.g0)     != Nothing ? convert.(T, nlpatx.g0) 	: nlpatx.g0
	nlpatxT.Hx 	  	= typeof(nlpatx.Hx)     != Nothing ? convert.(T, nlpatx.Hx) 	: nlpatx.Hx
	nlpatxT.mu 	  	= typeof(nlpatx.mu)     != Nothing ? convert.(T, nlpatx.mu) 	: nlpatx.mu
	nlpatxT.cx 	  	= typeof(nlpatx.cx)     != Nothing ? convert.(T, nlpatx.cx) 	: nlpatx.cx
	nlpatxT.Jx     		= typeof(nlpatx.Jx)     != Nothing ? convert.(T, nlpatx.Jx) 	: nlpatx.Jx
	nlpatxT.lambda 		= typeof(nlpatx.lambda) != Nothing ? convert.(T, nlpatx.lambda) : nlpatx.lambda

	return nlpatxT
end
