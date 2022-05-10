#import Pkg; Pkg.add("NLsolve")

using NLsolve

function solve(n, start_bound, finish_bound)

    function f_for_gauss(F, x)
        m = length(x) - 1
        for i in 0:m
            func = 0
            for j in 1:2:length(x)
                func += (x[j] * x[j + 1]^i)
            end
            func -= (finish_bound ^ (i + 1) - start_bound ^ (i + 1)) / (i + 1)
            F[i + 1] = func
        end
    end

    function f_for_g_kronrod(F, x)  
        m = length(x) - 1
        n = div((m - 1), 3)
        for i in 0:m
            func = 0
            for j in 1:n
                func += (x[j] * (x_values[j] ^ i))
            end
            for j in (n + 1):2:length(x)
                func += (x[j] * (x[j + 1] ^ i))
            end
            func -= ((finish_bound ^ (i + 1) - start_bound ^ (i + 1)) / (i + 1))
            F[i + 1] = func
        end
    end
    
    args_for_gauss = Float64[]
    for i in 1:n
        push!(args_for_gauss, 0)
        push!(args_for_gauss, 0)
    end
    result_for_gauss = nlsolve(f_for_gauss, args_for_gauss)
    println(result_for_gauss.zero)
    x_values = result_for_gauss.zero[2:2:end]
    # println(x_values)
    args_for_g_kronrod = Float64[]
    for i in 1:n
        push!(args_for_g_kronrod, 0)
    end
    for i in 1:(n + 1)
        push!(args_for_g_kronrod, 0)
        push!(args_for_g_kronrod, 0)
    end
    #initial_F = similar(args_for_g_kronrod)
    #df = OnceDifferentiable(f_for_g_kronrod, args_for_g_kronrod, initial_F)
    #println(nlsolve(df, args_for_g_kronrod).zero)
    result_for_g_kronrod = nlsolve(f_for_g_kronrod, args_for_g_kronrod
     , method = :newton)
    println(result_for_g_kronrod.zero)

    full_result = Float64[]
    for i in 1:n
        push!(full_result, result_for_g_kronrod.zero[i])
        push!(full_result, x_values[i])
    end
    for i in (n + 1):length(result_for_g_kronrod.zero)
        push!(full_result, result_for_g_kronrod.zero[i])
    end
    
    return full_result
end

function main()
    res = solve(2, 2, 3)
    fin = 0
    for i in 1:2:length(res) 
        fin = (res[i] * res[i + 1]^2)
    end
    println(fin)
end

main()

