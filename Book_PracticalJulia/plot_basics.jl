import Plots

Plots.plot([0, 3, 1, 4, 1])

Plots.plot([0, 0.13, 0.38, 0.88, 1.88], [0, 3, 1, 4, 1])

# plotting functions
f(x) = sin(1/x)

x = π/1000:π/1000:π

Plots.plot(x, f.(x))

# From Qwen coder using LM Studio
# Basics
# Simple line plot
x = 1:10
y = x .^ 2
Plots.plot(x, y, label="y = x²", xlabel="x", ylabel="y")

# Multiple plots
x = 0:0.1:2π
y1 = sin.(x)
y2 = cos.(x)
Plots.plot(x, y1, label="sin(x)", color=:blue)
Plots.plot!(x, y2, label="cos(x)", color=:red)  # ! adds to existing plot

# Scatter plot
x = rand(50)
y = rand(50)
Plots.scatter(x, y, label="Random points", alpha=0.7)

# Different Plot Types
# Bar chart
categories = ["A", "B", "C", "D"]
values = [23, 45, 56, 78]
Plots.bar(categories, values, label="Categories")

# Histogram
data = randn(1000)
Plots.histogram(data, bins=30, label="Normal distribution")

# 3D plot
x = y = -5:0.5:5
z = x' .* y
Plots.surface(x, y, z, label="Surface")

# Contour plot
Plots.contour(x, y, z, levels=10, label="Contour")
