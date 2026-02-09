module PkgWtTests
export greet, simple_add, type_multiply

function greet()
    "Hello world!"
end

function simple_add(a, b)
    a + b
end

function type_multiply(a::Float64, b::Float64)
    a * b
end

end # module PkgWtTests
