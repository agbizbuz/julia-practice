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