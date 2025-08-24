require("math")

function Problem1(x)
    for i = 1,10 do
        local answer = x * i
        print(x .. "*" .. i .. " = " .. answer)
    end
end

function Problem2(x)
    local result = 0
    for i=1,x do
        result = result + i^2
    end
    print(result)
end

function Problem3(x)
--Write a function in Lua that recieves a number and prints it's num ber of digits.
    local nbrDigits = 0
    if x == 0 then
        nbrDigits = 1
    else
        while x > 0 do
            x = math.floor(x / 10)
    
            nbrDigits = nbrDigits + 1
        end
    end
    
    print(nbrDigits)
end

function Problem4(x)
--Write a function in Lua that recieves a number n and prints it reversed, with as many zeros at the left as it has at its right.
    local remain = 0
    local reversed = ""
    if x == 0 then
        print(0)
    else
        while x ~= 0 do
            remain = x % 10
            x = math.floor(x/10)
            reversed = reversed .. remain
        end
    end
    print(reversed)
end

function Problem5(x)
-- A natural number is called cool if the sum of the digits which are in odd positions (starting to count on the right) is an even number. 
--For instance, 2 and 679031 are cool, but 357199 and 607 are not. 
--Write a function that given a natural number it prints if this nuber is cool or not.
    local digits = {}
    local sum = 0

    if x == 0 then
        print("Even")
    else
        while x > 0 do
            local digit = x % 10
            table.insert(digits, digit)
            x = math.floor(x/10)
        end
        for i = 1, #digits do
            if i % 2 == 1 then
                sum = sum + digits[i]
            end
        end
        if sum % 2 == 0 then
            print("Even")
        else
            print("Odd")
        end
    end
end