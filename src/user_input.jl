function input_function()
    print("Введите подынтегральную функцию: ")
    s = readline()
    try
        f = x -> Base.invokelatest(eval(Meta.parse("x -> " * s)), x)
        f(1)
        return f
    catch
        println("Некорректный ввод")
        return uinput()
    end
end


function input_bounds()
    try
        print("Введите нижнюю границу интегрирования: ")
        a::Float64 = parse(Float64, readline())
        print("Введите верхнюю границу интегрирования: ")
        b::Float64 = parse(Float64, readline())
        if b >= a
            return a, b
        else
            println("Верхняя граница должна быть больше нижней границы!")
            return input_bounds()
        end
    catch
        println("Некорректный ввод!")
        return input_bounds()
    end
end

function input_n()
    try
        print("Введите желаемую точность: ")
        n::UInt64 = parse(UInt64, readline())
        return n
    catch
        println("Некорректный ввод!")
        return input_n()
    end
end
