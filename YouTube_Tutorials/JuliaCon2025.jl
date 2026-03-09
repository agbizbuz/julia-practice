# source - https://www.youtube.com/watch?v=46hkaaDBgX4

println("Hello JuliaCon")

sqrt(2)
√2

cos(.5pi)

10^19
10.0^19
big(10)^19

2 < 3 <4 
2 > 3
10.0 === 10
10.0 == 10

x = 3
y = 2.5
x^2 + x*y + y^2

f(x, y) = x^2 + x*y + y^2
f(3, 2.5)
f(1 +2im, 3 +4im)

function blowup_count_while(x)
    count = 0
    while !isinf(x)
        x = x^2 + x
        count += 1
    end
    return count
end

function blowup_count_if(x)
   for count in 1:100
    x = x^2 + 1
    if isinf(x)
        return count
    end
   end 
   return 100 + 1
end


function blowup_count_if_max(x; max_itrs = 1000)
   for count in 1:max_itrs
    x = x^2 + x
    if isinf(x)
        return count
    end
   end 
   return max_itrs + 1
end

function mandlebrot_calc(x, c = x; max_itrs = 1000)
    for count in 1:max_itrs
        x = x^2 + c
        if abs2(x) > 4
            return count
        end
    end
    return max_itrs + 1
end