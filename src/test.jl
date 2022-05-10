#Casting

f1 = parse(Float64, "1")
i2 = parse(Int8, "1")

num = 32 / 0 ## num = Inf

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
end
a7 = [2^n for n in 1:10]
a8 = a4[1:2:end]
println(a8)


#Dicts
d1 = Dict("pi"=>3.14, "e"=>2.718)
delete!(d1, "pi")
println(haskey(d1, "pi"))
println(keys(d1))
println(values(d1))
for (key, value) in d1
    println(key, " : ", value)
end

#Sets
st1 = Set(["jam", "pam", "ram"])
println(st1)

push!(st1, "sam")
println(in("rom", st1))

#functions
getSum(x,y) = x + y
x, y = 1, 2
println(getSum(x, y))

function summ(a, b)
    return a+b
end

println(sum(2+2))


#maps creating
m1 = map(x -> x * x, [1, 2, 3])
m2 = map((x,y) -> x * y, [2, 3], [4,6])
println(m1)
println(m2)

v4 = reduce(+, 1:100) # о да круто


#А теперь попытка в ООП

struct Dog
    name::String
    bark::String
end

dog = Dog("Sobaka", "bark bark")

function makeSound(dog::Dog)
    println(dog.bark)
end

makeSound(dog)
