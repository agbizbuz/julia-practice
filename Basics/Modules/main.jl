# Simple Module
include("SimpleMod.jl")
using .SimpleMod

greet("World")
SimpleMod.unexported()

# Multiple Modules
include("MultiMod.jl")
using .ModB

func_b()

# Can use ModA export although it was used in ModB
# func_a()

import .ModA as MA
MA.func_a()

# Multi file module

include("MultiFileMod/MultiFileMod.jl")
using .MultiFileMod

func_file_1()
func_file_2()

# Parent Child modules
include("ParentChild.jl")
using .ParentModule
ans = add_D(3)
println("Using add_D from parent - $ans")
using .ParentModule.SubA
ans = add_D(5)
println("Using add_D from child - $ans")
import .ParentModule.SubB: Infinity
inf = Infinity()
ansspecial = add_D(inf)
println("Using specialised add_D from second child - $ansspecial")