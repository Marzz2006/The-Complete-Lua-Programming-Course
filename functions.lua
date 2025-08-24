function calculateSum(sequence)
    local sum = 0
    for i= 1, #sequence do
        sum = sum + sequence[i]
    end
    return sum
end