function maximum (s)
    local max_index = 1 --initial case
    local m = s[max_index]
    for i = 2, #s do
        if s[i] > m then
            m = s[i]
            max_index = i
        end
    end
    return m, max_index -- return max and it's max_index
end

function f () end

function f1 () return "a" end

function f2 () return "a", "b" end