include("MultiMod.jl")
using .ModB

func_b()

# Can use ModA export although it was used in ModB
# func_a()

import .ModA as MA
MA.func_a()