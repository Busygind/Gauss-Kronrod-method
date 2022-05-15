#Pkg.add("Roots")
using Roots

# function get_legendre_polynome(n)::Function
#     arr = [x -> 1, x -> x]
#     for i in 3:n+1
#         push!(arr, x -> ((((2 * n - 1) / n)) * x * arr[i - 1](x) - ((n-1) / n) * arr[i - 2](x)))
#     end
#     return arr[n+1]
# end

function get_legendre_polynome(n)::Function
    if n == 0
        return x -> 1
    elseif n == 1
        return x -> x
    else
        return x -> ((2 * n - 1) / n) * x * get_legendre_polynome(n-1)(x) - ((n-1) / n) * get_legendre_polynome(n-2)(x)
    end
end

function get_legendre_polynome_derivative(n, pₙ::Function, pₙ₋₁::Function)::Function
    return x -> ((n / (1 - x^2)) * (pₙ₋₁(x) - x * pₙ(x)))
end


function find_legendre_points_and_weights(n)
    pₙ = get_legendre_polynome(n)
    pₙ₋₁ = get_legendre_polynome(n-1)
    legendre_polynome_derivative = get_legendre_polynome_derivative(n, pₙ, pₙ₋₁)
    points = find_zeros(pₙ, -1, 1)

    calc_weights(x) = 2 / ((1 - x^2) * (legendre_polynome_derivative(x))^2)
    weights = [calc_weights(xᵢ) for xᵢ in points]
    return points, weights
end

function scale_x(x, a, b)
    return (b - a) * x / 2 + (a + b) / 2
end

function main()
    #function_init
    lower_bound = 2
    upper_bound = 4
    f(x) = (x^2)


    points, weights = find_legendre_points_and_weights(3)
    kronrod_points, kronrod_weights = find_legendre_points_and_weights(15)
    res = 0
    for i in 1:length(points)
        res += (weights[i] * f(scale_x(points[i], lower_bound, upper_bound)))
    end
    res *= (upper_bound - lower_bound) / 2
    println(res)

    res = 0
    for i in 1:length(kronrod_points)
        res += (kronrod_weights[i] * f(scale_x(kronrod_points[i], lower_bound, upper_bound)))
    end
    res *= (upper_bound - lower_bound) / 2
    println(res)
end

main()
