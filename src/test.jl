#Casting

f1 = parse(Float64, "1")
i2 = parse(Int8, "1")


#Strings

s1 = "bsasd eqwe q sad sada \n"
println(length(s1))
println(s1[1]) # <--- первый элемент с 1
println(s1[1:4])
i1 = 2
i2 = 3
println("$i1 + $i2 = $(i1 + i2)")



#Arrays
a1 = zeros(Int32, 2, 2)
a2 = Array{Int32}(undef, 5)
a3 = Float64[]
a4 = [1,2,3]
println(a4[1])
println(a4[end])
println(5 in a4)
f(a) = (a >= 2) ? true : false
println(findall(f,a4))
println(count(f, a4))
a5 = [sin, cos, tan]
for ff in a5        ## Я влюбился
    println(ff(0))
end

a6 = [1 2 3; 4 5 6] #двумерный массив
for n = 1:2, m = 1:3
    println(a6[n, m])

a7 = [2^n for n in 1:10]
