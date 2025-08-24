require("math")

--Problem1
--Write a function that given a positive integer n, prints the first n binary numbers in ascending order. 
--A binary number is a number expressed in base-2, consisting of the digits 0 and 1.

function problem1()
    print("Enter a positive integer:")
    local input = io.read()

    print("You entered: " .. input)

    local queue = {1}
    for i = 1, input do
    local  front = table.remove(queue,1)
    print(front)
    table.insert(queue, front .. "0")
    table.insert(queue, front .. "1")
    end
end

--Problem2
--Write a function to simulate the Hot Potato game. In this game, children sit ina circle, and an object(e.g., a potato) is passed from
--one child to another. At a certain point in time, the object is stopped, and the child who is holding the object is removed from the circle.
--the process is repeated until only one child remains - the winner of the game.

--the function will receive the children sequence and the number of passes.

function problem2(children, passes)
    local queue = {}
    for i = 1, #children do
        table.insert(queue, children[i])
    end
    while #queue > 1 do
        for i = 1, passes - 1 do
            local child = table.remove(queue,1)
            table.insert(queue,child)
        end
        local removed = table.remove(queue,1)
        print(removed, " was eliminated.")
    end
    local winner = queue[1]
    return "The winner of the Hot Potato Game is: " .. winner
end

--Problem3
--Write a function that received a list of numbers and a target number.
--Your task is to determine if there is a pair of distinct number in the list that adds up to the target number.
--It returns true if there is a matching pair, otherwise false.

function problem3(numbers, target)
    local queue = {}
    for _,num in ipairs(numbers) do
        local compliment = target - num
        for _,qelem in ipairs(queue) do
            if qelem == compliment  then
                return true
            end
        end
        table.insert(queue,num)
    end
    return false
end