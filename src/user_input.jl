function func_input()
    print("Введите подынтегральную функцию: ")
    s = readline()
    try
        f = x -> Base.invokelatest(eval(Meta.parse("x -> " * s)), x)
        f(1)
        return [s, f]
    catch
        println("Некорректный ввод")
        return uinput()
    end
end

function n_input()
	print("Введите степень точности: ")
	s = readline()
	n = tryparse(Int64, s)
	if (n == nothing)
		println("Некорректный ввод")
		return n_input()
	else
		return n
	end
end

