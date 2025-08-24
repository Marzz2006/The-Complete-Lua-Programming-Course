function example1(v)
    if v < 0 then v = 0 end
end

function example2(a, b)
    if a < b then return a else return b end
end

function example3(x)
    if x > 0 then
        print("approved")
    else
        print("suspended")
    end
end