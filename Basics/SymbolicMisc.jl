# Freeform practice of Symbolics
using Symbolics, Plots

@variables x, y

t = [-5:5]

f = x^2 + 1
g = y^3

plot(t, f)
plot(t, g)

# plot(t, [f g]) # TODO - Fix this