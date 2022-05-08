f(x) = 2x^100 - 3x + 2
g(x,n) = x^n
x = 10000
fval = f(x)
println(f(x), g(x, 1))
for i in 1:100000
    if g(x, i) > fval
        println(i)
        break
    end
end