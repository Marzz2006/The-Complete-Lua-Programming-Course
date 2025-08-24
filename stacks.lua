os.execute("cls")
local stack = {}

function push(element)
    table.insert(stack,element)
end

function pop()
    table.remove(stack)
end

function isEmpty()
    return #stack == 0
end

function top()
    if not isEmpty() then
        return stack[#stack]
    end    
end