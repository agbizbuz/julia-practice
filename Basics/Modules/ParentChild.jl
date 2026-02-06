module ParentModule
module SubA
export add_D  # exported interface
const D = 3
add_D(x) = x + D
end
using .SubA  # brings `add_D` into the namespace
export add_D # export it from ParentModule too
module SubB
import ..SubA: add_D # relative path for a “sibling” module
#=
import ParentModule.SubA: add_D # when in a package, such as when this is loaded by using or import, 
this would be equivalent to the previous import, but not at the REPL
=#
struct Infinity end
function add_D(x::Infinity)
    println("Specialised add_D in child Module SubB")
    return x
end
end
end
