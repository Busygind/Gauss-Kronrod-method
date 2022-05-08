#import Pkg; Pkg.add("NLsolve")

using NLsolve

function solve(m, start_bound, finish_bound)

    function f_for_gauss(F, x)
        m = length(x) - 1
        for i in 0:m
            func = 0
            for j in 1:2:length(x)
                func += (x[j] * x[j + 1]^i)
            end
            func -= ((finish_bound ^ (i + 1) - start_bound ^ (i + 1)) / (i + 1))
            F[i + 1] = func
        end
    end
    
    n = ceil((m + 1) / 2)
    args_for_gauss = Float64[]
    for i in 1:n
        push!(args_for_gauss, typemin(Int64))
        push!(args_for_gauss, typemin(Int64))
    end
    #push!(args_for_gauss, ((finish_bound ^ (i + 1) - start_bound ^ (i + 1)) / (i + 1)))
    result = nlsolve(f_for_gauss, args_for_gauss)
    println(result.zero)
end

solve(3, 2, 3)
