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
divcheck = [number % 3 == 0, number % 5 == 0, number % 7 == 0]
# yesno = ["yes", "no"]
println("$number is divisible by 3 - $(divcheck[1])")
println("$number is divisible by 5 - $(divcheck[2])")
println("$number is divisible by 7 - $(divcheck[3])")

# print which quadrent in the cartesian plane the point is located
x, y = rand(-1.0:0.1:1.0, 2)
# primitive way
if x > 0 && y > 0
    println("The point ($x, $y) lies in first quadrent")
elseif x < 0 && y > 0
    println("The point ($x, $y) lies in second quadrent")
elseif x < 0 && y < 0
    println("The point ($x, $y) lies in third quadrent")
elseif x > 0 && y < 0
    println("The point ($x, $y) lies in fourth quadrent")
elseif x == 0 && y == 0
    println("The point ($x, $y) is at origin")
else
    println("The point ($x, $y) lies on axis")
end