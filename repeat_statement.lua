function example1()
    print("Example1")
    local count = 1
    repeat
        print("Count:print " .. count)
        count = count + 1
    until count > 5
end

function example2()
    local i = 1
    repeat
        print("Inside Loop " .. i)
        i = i + 1
        if i == 4 then
            break
        end
    until i > 5
    if i < 5 then
        print("Loop broken early at: " .. i)
    else
        print("Loop ended at: " .. i)
    end
end

function example3()
    local i = 1
    repeat
        local j = 1
        repeat
            print("i: " .. i .. "j: " .. j)
            j = j + 1
        until j > 3
        i = i + 1
    until i > 2
end