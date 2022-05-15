include("./user_input.jl")
include("./GKSolver.jl")


function main()
    f = input_function()
    a, b = input_bounds()
    n = input_n()
    g_integral, gk_integral, error = solve(f, a, b, n)
    println(g_integral)
    println(gk_integral)
    println(error)
end

main()
