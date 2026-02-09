# constants
const LANG="DE"

# functions
function hello(name)
    if LANG == "DE"
        println("Hallo liebe/r $name !")
    else
        println("Hello dear $name !")
    end
end

# main program
function main()
    hello("Peter")
    hello("Jane")
end

main()
nothing