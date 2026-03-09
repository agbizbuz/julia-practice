# source - https://www.youtube.com/watch?v=lSGFAmXKIsE
import DifferentialEquations as DE
using Plots

# Solving ODE - lorenz equation
function lorenz!(du, u, p, t)
    x, y, z = u
    σ, ρ, β = p
    du[1] = dx = σ * (y - x)
    du[2] = dy = x * (ρ - z) - y
    du[3] = dz = x * y - β * z
end

u0 = [1.0, 0.0, 0.0]
tspan = (0.0, 100.0)
p = [10.0, 28.0, 8 / 3]
prob = DE.ODEProblem(lorenz!, u0, tspan, p)

soln = DE.solve(prob)
# Plot the 3D trajectory
a3DPlot = plot(soln, vars = (1, 2, 3), legend = false, lw = 1.5, title = "Lorenz Attractor")
animate(soln, lw = 3, every = 4)
animate(soln, vars = (1, 2, 3), lw = 1.5, every = 4)
# multiplots
xyzt = Plots.plot(soln, plotdensity = 10000, lw = 1.5)
xy = Plots.plot(soln, plotdensity = 10000, idxs = (1, 2))
xz = Plots.plot(soln, plotdensity = 10000, idxs = (1, 3))
yz = Plots.plot(soln, plotdensity = 10000, idxs = (2, 3))
xyz = Plots.plot(soln, plotdensity = 10000, idxs = (1, 2, 3))
Plots.plot(Plots.plot(xyzt, xyz), Plots.plot(xy, xz, yz, layout = (1, 3), w = 1), layout = (
    2, 1))

# choosing different solvers, e.g. for a Stiff equation - ROBER
function rober!(du, u, p, t)
    y₁, y₂, y₃ = u
    k₁, k₂, k₃ = p
    du[1] = -k₁ * y₁ + k₃ * y₂ * y₃
    du[2] = k₁ * y₁ - k₂ * y₂^2 -  k₃ * y₂ * y₃
    du[3] = k₂ * y₂^2
    nothing
end

prob1 = DE.ODEProblem(rober!, [1.0, 0.0, 0.0], (0.0, 1e5), [0.04, 3e7, 1e4])
soln1 = DE.solve(prob1, DE.Rodas5P())
plot(soln1, tspan = (1e-6, 1e5))
# plot logs
plot(soln1, tspan = (1e-6, 1e5), xscale = :log10, yscale = :log10)
