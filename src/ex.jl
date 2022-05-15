using NLsolve

function lfgs(F, x)
    F[1] = x[1] + x[2] + x[4] - 1
    F[2] = x[1] * 5/2 + x[2] * x[3] + x[4] * x[5] - 5/2
    F[3] = x[1] * (5/2)^2 + x[2] * (x[3] ^ 2) + x[4] * (x[5] ^ 2) - 19/3
    F[4] = x[1] * (5/2)^3 + x[2] * (x[3] ^ 3) + x[4] * (x[5] ^ 3) - 65/4
    F[5] = x[1] * (5/2)^4 + x[2] * (x[3] ^ 4) + x[4] * (x[5] ^ 4) - 211/5
    # F[6] = x[1] * (5/2)^5 + x[2] * (x[3] ^ 5) + x[4] * (x[5] ^ 5) - 665/6
end

function j!(J, x)
    J[1, 1] = x[2]^3-7
    J[1, 2] = 3*x[2]^2*(x[1]+3)
    u = exp(x[1])*cos(x[2]*exp(x[1])-1)
    J[2, 1] = x[2]*u
    J[2, 2] = u
end

function main()
    # println(nlsolve(lfgs, [0.4, 0.3, 2.75, 0.3, 2.1], show_trace = false).zero)
    println(nlsolve(lfgs, [0.0, 0.0, 0.0, 0.0, 0.0], method = :newton, iterations=10).zero)
end

main()
