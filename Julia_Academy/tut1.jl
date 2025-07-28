# types in Julia
an_int = 42
println(typeof(an_int))
a_float = 3.14159
println(typeof(a_float))

#=
Variables can be reassigned
It's type will change automatically
=#
a_float = 52
println(typeof(a_float))

# exercise
days = 365
days_float = convert(Float64, days)

@assert days == 365
@assert days_float == 365.0

# unicode
α = 22