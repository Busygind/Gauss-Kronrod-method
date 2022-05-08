using Pkg


function uinput()
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

function get_power(s)
	re = r"\^[0-9]+"
	matches = findall(re, s)
	power = 0
	for elem in matches
		power += abs(parse(Int32, s[elem][2:end]))
	end
	return power
end

input_result = uinput()
println(get_power(input_result[1]))
println(input_result[2](6))
