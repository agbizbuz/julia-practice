module SimpleMod

# Exports
export greet

# Imports

# Module Content

greet(name::String) = println("Hello $name")

unexported() = println("This is unexported function, can only be used with full qualification")

end