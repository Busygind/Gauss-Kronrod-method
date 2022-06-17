using Test
include("../src/GKSolver.jl")
include("../src/user_input.jl")


function output_answer(i, f, a, b, g_integral, gk_integral, error, answer)
    printstyled("Тест $(i)", color = :170)
    println()
    println("f = ", f)
    println("От a = $(a) до b = $(b)")
    println("По методу Гаусса: ", g_integral)
    printstyled("По методу Гаусса-Кронрода: ", gk_integral, color = :green)
    println()
    println("Погрешность метода Гаусса: ", error)
    printstyled("Посчитал Сергей Вольфрам: ", answer, color = :green)
    println("===============================")
end


function main()

    n::UInt64 = input_n()
    println("Тестирование...")
    println("===============================")

    i = 0

    #Линейная функция
    function linear_f_test()
        str_f = "77382*x - 3589032"
        f = x -> Base.invokelatest(eval(Meta.parse("x -> " * str_f)), x)
        a::Float64, b::Float64 = -34, 171
        answer = 350885175
        i += 1
        g_integral, gk_integral, error = solve(f, a, b, n)
        output_answer(i, str_f, a, b , g_integral, gk_integral, error, answer)
    end

    #Обратная пропорциональность
    function inverse_f_test()
        str_f = "3/x + 7"
        f = x -> Base.invokelatest(eval(Meta.parse("x -> " * str_f)), x)
        a::Float64, b::Float64 = 22, 337
        answer = 2213.187121430982137
        i += 1
        g_integral, gk_integral, error = solve(f, a, b, n)
        output_answer(i, str_f, a, b , g_integral, gk_integral, error, answer)
    end

    #Квадратичная функция
    function square_f_test()
        str_f = "(1/8*x^2) - 5"
        f = x -> Base.invokelatest(eval(Meta.parse("x -> " * str_f)), x)
        a::Float64, b::Float64 = 11, 22
        answer = 7997/24
        i += 1
        g_integral, gk_integral, error = solve(f, a, b, n)
        output_answer(i, str_f, a, b , g_integral, gk_integral, error, answer)
    end

    #Степенная функция
    function power_f_test()
        str_f = "(x^2 + 2*x)^(1/4) - 8x"
        f = x -> Base.invokelatest(eval(Meta.parse("x -> " * str_f)), x)
        a::Float64, b::Float64 = 1, 666 
        answer = -1.7627381131e6
        i += 1
        g_integral, gk_integral, error = solve(f, a, b, n)
        output_answer(i, str_f, a, b , g_integral, gk_integral, error, answer)
    end

    #Показательная функция
    function exp_f_test()
        str_f = "exp(x - 2)"
        f = x -> Base.invokelatest(eval(Meta.parse("x -> " * str_f)), x)
        a::Float64, b::Float64 = -1, 6 
        answer = 54.5483629
        i += 1
        g_integral, gk_integral, error = solve(f, a, b, n)
        output_answer(i, str_f, a, b , g_integral, gk_integral, error, answer)
    end

    #Логарифмическая функция
    function log_f_test()
        str_f = "log(x + 1456)"
        f = x -> Base.invokelatest(eval(Meta.parse("x -> " * str_f)), x)
        a::Float64, b::Float64 = -115, 61 
        answer = 1278.48114419099
        i += 1
        g_integral, gk_integral, error = solve(f, a, b, n)
        output_answer(i, str_f, a, b , g_integral, gk_integral, error, answer)
    end

    #Тригонометрическая функция
    function trig_f_test()
        str_f = "cos(x + 45) + sin(x - 2) + 45"
        f = x -> Base.invokelatest(eval(Meta.parse("x -> " * str_f)), x)
        a::Float64, b::Float64 = -2, 10
        answer = 539.3238759
        i += 1
        g_integral, gk_integral, error = solve(f, a, b, n)
        output_answer(i, str_f, a, b , g_integral, gk_integral, error, answer)
    end

    #Обратная Тригонометрическая функция
    function inverse_trig_f_test()
        str_f = "acos(Complex(x)) + asin(Complex(x))"
        f = x -> Base.invokelatest(eval(Meta.parse("x -> " * str_f)), x)
        a::Float64, b::Float64 = 1, 107
        answer = 53pi
        i += 1
        g_integral, gk_integral, error = solve(f, a, b, n)
        output_answer(i, str_f, a, b , g_integral, gk_integral, error, answer)
    end

    linear_f_test()
    inverse_f_test()
    square_f_test()
    power_f_test()
    exp_f_test()
    log_f_test()
    trig_f_test()
    inverse_trig_f_test()
end

main()
