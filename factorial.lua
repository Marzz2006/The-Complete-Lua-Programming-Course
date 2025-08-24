-- Recursive Factorial
function Factorial(n)
    if n == 0 then
        return 1
    else
        return n * Factorial(n-1) --recursive case
    end
end