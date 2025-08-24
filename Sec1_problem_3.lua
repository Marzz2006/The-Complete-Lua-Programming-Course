require("math")

function stamps(n)
    local p = 0
    local q = 0

    while n >=4 and n % 7 ~= 0 do
        q = q + 1
        n = n - 4
    end

    p = math.floor(n / 7)
    return p, q
end