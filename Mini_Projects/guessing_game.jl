# a number  guessing game

let guess_count = 0, guessed = false, answer = rand(1:100)
    println("Guess a number between 1 and 100, press any key to quit: ")
    while !guessed
        guess_num = 0
        guess_str = readline()
        try
            guess_num = parse(Int64, guess_str)
        catch
            println("Ok, quitting the game. See you next time")
            Base.exit(0)
        end
        guess_count += 1
        if guess_num == answer
            println("Bingo - you guessed the number")
            println("You guessed in $guess_count attempts")
            guessed = true
        elseif guess_num < answer
            println("Your guess is lower, try again : ")
        else
            println("Your guess is higher, try again : ")
        end
    end
end