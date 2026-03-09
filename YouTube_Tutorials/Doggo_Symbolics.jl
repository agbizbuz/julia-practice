# source - https://www.youtube.com/watch?v=L47k2zjPU9s

using Symbolics
using Latexify
using SymbolicNumericIntegration

# Algebra
@variables t x y z

ex0 = -4//3 * x + y ~ 2
latexify(ex0)

Symbolics.solve_for(ex0, x)

Symbolics.solve_for(ex0, y)

# Linear Algebra
ex1 = 3x + 2y - z ~ 1
ex2 = 2x - 2y + 4z ~ -2
ex3 = -x + 1//2 * y - z ~ 0

Symbolics.solve_for([ex1, ex2, ex3], [x, y, z])

# Differential Calculus
# relations between distnace, acceleration and velocity
position = -16 * t^2 + 16t + 32
D = Differential(t)

position_dot = D(position)
velocity = expand_derivatives(position_dot)
position_ddot = D(velocity)
acceleration = expand_derivatives(position_ddot)

# Numeric Symbolics
ex4 = 3 * x^3 + 2x -5
integrate(ex4)

f = sqrt(x)
integrate(f)

# convert the symbolics to a julia function
to_compute = integrate(f)[1]
f_expr = build_function(to_compute, x)
myf = eval(f_expr)

area = myf(4)