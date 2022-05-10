import math

import sympy as sm


def generate_arguments_for_gauss(n: int) -> []:
    symbols = []
    for i in range(n):
        symbols += [f'c{i}', f'x{i}']
    return symbols


def generate_arguments_for_gauss_kronrod(n: int) -> []:
    symbols = []
    for i in range(n):
        symbols += [f'a{i}']
    for i in range(n + 1):
        symbols += [f"b{i}"]
        symbols += [f"y{i}"]
    return symbols


def generate_funcs_for_gauss(params: [], start_bound: int, finish_bound: int) -> []:
    m = len(params) - 1
    funcs = []
    for i in range(m + 1):
        func = ""
        for j in range(0, len(params), 2):
            func += f"{params[j]} * {params[j + 1]}**{i} + "
        func += f" - {finish_bound ** (i + 1) - start_bound ** (i + 1)} / {i + 1}"
        funcs += [func]
    return funcs


def generate_funcs_for_gauss_kronrod(params: [], start_bound: int, finish_bound: int, x_values: []) -> []:
    m = len(params) - 1
    n = (m - 1) // 3
    funcs = []
    for i in range(m + 1):
        func = ""
        for j in range(n):
            func += f"{params[j]} * ({x_values[j]})**{i} + "
        for j in range(n, len(params), 2):
            func += f"{params[j]} * {params[j + 1]}**{i} + "
        func += f" - {finish_bound ** (i + 1) - start_bound ** (i + 1)} / {i + 1}"
        funcs += [func]
    return funcs


def solve(n: int, start_bound: int, finish_bound: int) -> []:
    def f(x: int):
        return math.sin(x)

    params_for_gauss = sm.symbols(generate_arguments_for_gauss(n))
    funcs_for_gauss = generate_funcs_for_gauss(params_for_gauss, start_bound, finish_bound)
    sympified_funcs_for_gauss = []
    for func in funcs_for_gauss:
        sympified_funcs_for_gauss += [sm.sympify(func)]
    sympified_funcs_for_gauss = [sm.nsimplify(f, rational=1) for f in sympified_funcs_for_gauss]
    res_of_gauss_method = sm.nonlinsolve(sympified_funcs_for_gauss, params_for_gauss).args[0]
    x_values = res_of_gauss_method[1::2]
    print(x_values)

    params_for_gauss_kronrod = sm.symbols(generate_arguments_for_gauss_kronrod(n))
    funcs_for_gauss_kronrod = generate_funcs_for_gauss_kronrod(params_for_gauss_kronrod, start_bound, finish_bound,
                                                               x_values)
    sympified_funcs_for_g_kronrod = []
    for func in funcs_for_gauss_kronrod:
        sympified_funcs_for_g_kronrod += [sm.sympify(func)]
    sympified_funcs_for_g_kronrod = [sm.nsimplify(f, rational=1) for f in sympified_funcs_for_g_kronrod]

    res_of_g_k = sm.nonlinsolve(sympified_funcs_for_g_kronrod, params_for_gauss_kronrod).args[0]
    return float(solve_func(x_values, res_of_g_k, n, f))


def solve_func(set_of_x: [], set_of_coefficients: (), n: int, f):
    set_of_a = set_of_coefficients[0:n]
    gauss_part = 0
    for i in range(n):
        gauss_part += set_of_a[i] * f(set_of_x[i])
    set_of_b = set_of_coefficients[n::2]
    set_of_y = set_of_coefficients[n + 1::2]
    cronrod_part = 0
    for i in range(n + 1):
        cronrod_part += set_of_b[i] * f(set_of_y[i])
    final_answer = gauss_part + cronrod_part
    return final_answer


if __name__ == '__main__':
    print(solve(3, 2, 5))
