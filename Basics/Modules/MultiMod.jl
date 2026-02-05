module ModA

export func_a
func_a() = println("func_a from Module ModA")

end

module ModB

export func_b
using ..ModA

function func_b()
    println("func_b from ModB - Start")
    println("calling func_a from ModA")
    func_a()
    println("func_b from ModB - End")

end

end
