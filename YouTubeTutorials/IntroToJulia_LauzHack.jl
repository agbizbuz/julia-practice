# source - https://www.youtube.com/watch?v=O6CF-UHArMs

using LinearAlgebra
using LogarithmicNumbers
using Unitful
using Measurements
using IntervalArithmetic
using Symbolics
using DifferentialEquations
using Plots

# generate a matrix with fibonacci numbers
exp(diagm(-1 => 1:4))

# manual sqrt function from Theon's algorithm
function mysqrt(a)
    x = a
    for k in 1:100
        x = 0.5 * (x + a/x) # Newton's fix point method
    end
    return x
end

mysqrt(2)

# using the mysqrt function to calculate derivative of a function

# define a new number type for derivative
struct Dual{T}
    x::T # value
    δ::T # purturbation
end

# define basic operators
Base.:*(m, a::Dual) = Dual(m * a.x, m * a.δ)
Base.:+(a::Dual, b::Dual) = Dual(a.x + b.x, a.δ + b.δ)
Base.:/(a::Dual, b::Dual) = Dual(a.x / b.x, (b.x * a.δ - a.x * b.δ) / b.x^2)

# apply the custom sqrt function to our new data type
mysqrt(Dual(2, 1))

# another custom function for square norm
mysqnorm(v) = sum(abs2, v)

v = [1, 2, 3]
mysqnorm(v)

v_log = LogFloat64.(v)
mysqnorm(v_log)

@assert mysqnorm(v) ≈ exp(log(mysqnorm(v_log)))

# numbers with physical units
v_unit = [1u"m", 2u"m", 3u"m"]
mysqnorm(v_unit)

# numbers with uncertainities
v_meas = [ 1 ± 0.1, 2 ± 0.2, 3 ± 0.3]
mysqnorm(v_meas)

# using interval arithmetic
v_interv = [interval(0.9, 1.1), interval(1.8, 2.2), interval(2.7, 3.3)]
mysqnorm(v_interv)

# Symbolic computations
Symbolics.@variables v₁, v₂, v₃
v_symb = [1v₁, 2v₂, 3v₃]
mysqnorm(v_symb)

# Vandermonde matrix
function vander_mtrx(x::AbstractVector{T}) where T
    m = length(x)
    V = Matrix{T}(undef, m, m)
    for j in 1:m
        V[j, 1] = one(x[j])
    end
    for i in 2:m, j in 1:m 
        V[j, i] = x[j] * V[j, i-1]
    end
    return V
end

vander_mtrx(1:5)

# differential equations - solve for pendulum motion

function pendulum!(du, u, p, t)
    g, L = p
    θ, dθ = u
    du[1] = dθ
    du[2] = -(g / L) * θ
end

begin
    uncertainty = 1
    g = 9.79 ± uncertainty * 0.02 # Gravitational constant
    L = 1.00 ± uncertainty * 0.02 # Length of the pendulum
    u₀ = [0 ± 0, (π / 60) ± uncertainty * 0.001] # Initial speed and angle
    tspan = (0 ± 0, 6 ± 0) # Time interval
    p = (g, L) # Numerical parameters
    prob = ODEProblem(pendulum!, u₀, tspan, p)
    sol = solve(prob, Tsit5(), reltol = 1e-6)
    plot(sol.t, getindex.(sol.u, 2), 
        label="pendulum speed variations",
        title="Pendulum Motion",
        xlabel="time",
        ylabel="speed"
    )
end