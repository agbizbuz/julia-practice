# Mandlebrot from JuliaCon

using Colors: colormap
using Images

function escape_count(x, c = x; max_itrs = 1000)
    for count in 1:max_itrs
        x = x^2 + c
        if abs2(x) > 4
            return count
        end
    end
    return max_itrs + 1
end

function get_mandelbrot(xs, ys, c; depth=100, cmap=colormap("rdbu", depth+1))
    cmap[escape_count.(xs' .+ ys.*im, c; max_itrs=depth)]
end

function get_mandelbrot(xs, ys; depth=100, cmap=colormap("rdbu", depth+1))
    cmap[escape_count.(xs' .+ ys.*im; max_itrs=depth)]
end

xs = -2:0.1:1

ys = -1:0.1:1

xs_new = range(-2, 1, length=10)
ys_new = range(-1, 1, length = 10)
display(get_mandelbrot(xs_new, ys_new))

xs_800 = range(-2, 2, length = 800)
ys_600 = range(-2, 2, length = 800)

display(get_mandelbrot(xs_800, ys_600))

cs = [0.8im, 0.37 + 0.1im, 0.355 + 0.355im, -0.54 + 0.54im, -0.4 + -0.59im,  0.34 + -0.05im,
0 + 0.8im, 0.37 + 0.1im, 0.355 + 0.355im, -0.54 + 0.54im,-0.4 + -0.59im, 
0.355534 - 0.337292im]

for c in cs
    fig = get_mandelbrot(xs_800, ys_600, c; )
    display(fig)
end