function findPolynomial(x,...)
    local coefficients = {...}
    local degree = #coefficients -1
    local result = 0

    for i = 0, degree do
    result = result + coefficients[i+1]*x^i
    end
    return result
end