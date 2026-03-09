# Performance tips and tricks
# source - https://youtu.be/gzvn-hdlkUg?si=5f8MBECKhmQoHoe9

# Naive code
n = 100_000_000
a = 2.718

using Random

Random.seed!(1)

x = rand(n)
y = rand(n)

z = []

# 1st time will compile functions and macros

@time for i in 1:n
    temp = a * x[i] + y[i]
    push!(z, temp)
end

z = []

# 2nd time there is no compilation

@time for i in 1:n
    temp = a * x[i] + y[i]
    push!(z, temp)
end

# 1st time - 101.947916 seconds (700.00 M allocations: 14.876 GiB, 31.43% gc time, 0.01% compilation time)
# 2nd time - 116.329655 seconds (700.00 M allocations: 14.876 GiB, 42.45% gc time)

# wrap code inside a function
function getArray(a, x, y)
    z = []
    for i in 1:length(x)
        temp = a * x[i] + y[i]
        push!(z, temp)
    end
    return z
end

@time getArray(a, x, y)
# - 42.841032 seconds (100.01 M allocations: 4.445 GiB, 50.19% gc time, 0.15% compilation time)