require("math")

-- Write a function to determine, given a sequence of integers, whether the sequence is a palindrome or not.
-- In other words, it is necessary to indicate wether the sequence is the same when read from left to right or from right to left.

function problem1()
    print("Enter a word or sequence of numbers:")
    local input = io.read()
    local sequence = {}

    sequence = create_sequence(input)

     if palindrome(sequence) then
        --print("Sequence:", table.concat(sequence, ", "))
        print(input .. " is a palindrome")
     else
        print(input .. " is not a palindrome")
     end

end

function palindrome(sequence)
    local is_palindrome = true
    --print(#sequence)
    local left = 1
    local right = #sequence
    while left <= right do
        if sequence[left] ~= sequence[right] then
            is_palindrome = false
            break
        end
        left = left + 1
        right = right - 1
    end

    return is_palindrome
end

function create_sequence(input) 
    --print(input)
    --print(#input)
    local sequence = {}
    for i = 1, #input do
        local character = string.sub(input, i, i)
        --print("Character", i, ":", character)
        table.insert(sequence,character)
    end
    --print(#sequence)
    return sequence
end

