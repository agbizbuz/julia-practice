msg = "Hello World"
println("Julia says $msg")

# from https://www.youtube.com/watch?v=uiQpwMQZBTA&list=PLP8iPy9hna6TRg6qJaBLJ-FRMi9Cp7gSX
# test if a number is multiple of 3, 5 or 7
number = rand(1:100)
# primitive way
if number % 3 == 0
    println("$number is divisible by 3")
elseif number % 5 == 0
    println("$number is divisible by 5")
elseif number % 7 == 0
    println("$number is divisible by 7")
else
    println("$number is not divisible by 3, 5 or 7")
end

# improvement 1
isDivisibleBy3_5_7 = [number % 3 == 0, number % 5 == 0, number % 7 == 0]
# yesno = ["yes", "no"]
println("$number is divisible by 3 - $(isDivisibleBy3_5_7[1])")
println("$number is divisible by 5 - $(isDivisibleBy3_5_7[2])")
println("$number is divisible by 7 - $(isDivisibleBy3_5_7[3])")

# print which quadrant in the cartesian plane the point is located
x, y = rand(-1.0:0.1:1.0, 2)
# primitive way
if x > 0 && y > 0
    println("The point ($x, $y) lies in first quadrant")
elseif x < 0 && y > 0
    println("The point ($x, $y) lies in second quadrant")
elseif x < 0 && y < 0
    println("The point ($x, $y) lies in third quadrant")
elseif x > 0 && y < 0
    println("The point ($x, $y) lies in fourth quadrant")
elseif x == 0 && y == 0
    println("The point ($x, $y) is at origin")
else
    println("The point ($x, $y) lies on axis")
end