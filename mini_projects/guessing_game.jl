# a number  guessing game

answer = rand(1:100)
println("Guess a number between 1 and 100, press any key to quit: ")
let guess_num
    guessed = false
    guess_count = 0
    while !guessed
        guess_str = readline()
        try
            guess_num = parse(Int64, guess_str)
        catch
            println("Ok, quitting the game. See you next time")
            Base.exit(0)
        end
        if guess_num == answer
            println("Bingo - you guessed the number")
            println("You guessed in $guess_count attempts")
            guessed = true
        elseif guess_num < answer
            println("Your guess is lower, try again : ")
        else
            println("Your guess is higher, try again : ")
        end
        guess_count += 1
    end
end
