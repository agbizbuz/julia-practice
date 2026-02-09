using Plots, DataFrames

function main()
    time = 0:0.01:10             # step range from 0 to 10 step 0.1
    u = sin.(time*5)          # signal with a frequency of 5 rad/s
    step = 1 .- 1 ./ exp.(time)  # step response
    df = DataFrame(; time, u, step)
    plt = plot(df.time, u, legend = false)
    plot!(df.time, step)
    plt
end
plt = main()
