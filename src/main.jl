include("./user_input.jl")
include("./GKSolver.jl")


function main()
    inputed_function = input_function()
    inputed_lower_bound, inputed_upper_bound = input_bounds()
    inputed_n = input_n()
    g_integral, gk_integral, error = solve(inputed_function, inputed_lower_bound, inputed_upper_bound, inputed_n)
    println("Значение интеграла, посчитанное методом Гаусса: ", g_integral)
    println("Значение интеграла, полученное методом Гаусса-Кронрода: ", gk_integral)
    println("Ошибка расчета погрешности вычислений по Гауссу: ", error)
end

main()
