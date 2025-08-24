function outerFunction(x)
    return function()
        print(x)
    end
end

local innerFunction=outerFunction(42)
innerFunction()

function myIterator(s)
    local index = 0
    local length = #s

    return function()
        index = index + 1
        if index <= length then
            return s[index], index
        end
    end
end

function genericFor(s)
    -- Iterate over the collection using the generic "for" loop
    for item, index in myIterator(s) do
        print(item, index)
    end
end