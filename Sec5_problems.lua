--Problem 1
--Write a program to compute the profits of the player of a casino.
--The operations that can be done are: Enter the Casino, Leave the Casino, Or Win/Lose a Quantity of Money(may be negative)

function problem1()
    local input = [[
        Anna enters
        Anna wins 50
        Anna loses 200
        Anna leaves
        Ben enters
        James enters
        Ben wins 100
        Michael enters
        Ben loses 40
        Ben leaves
        James wins 30
        Ben enters
        Ben loses 20
        ]]
        
        calculateWinnings(input)
        print()

        local input2 = [[
        Amalia leaves
        Berta wins 3
        Cristina enters
        Cristina wins 7
        Cristina enters
        Cristina leaves
        Cristina leaves
        ]]

        calculateWinnings(input2)
end

function calculateWinnings(input)
    local players = {}
    local inside = {}

    for line in input:gmatch("[^\r\n]+") do
        local name, action, amount = line:match("(%S+)%s(%S+)%s?(%-?%d*)")

        if action  == "enters" then
            if inside[name] then
                print(name .. " is already inside the Casino!")
            else
                inside[name] = true
                players[name] = 0
            end
        elseif action == "leaves" then
            if inside[name] then
                print(name .. " left the Casino!")
                print(name .. " has won " .. players[name])
                inside[name] = nil
                players[name] = nil
            else
                print(name .. " is not inside the Casino!")
            end
        elseif action == "wins" then
            if not inside[name] then
                print(name .. " is not inside the Casino!")
            else
                amount = tonumber(amount)
                players[name] = (players[name] or 0) + amount
            end
        elseif action == "loses" then
            if not inside[name] then
                print(name .. " is not inside the Casino!")
            else
                amount = tonumber(amount)
                players[name] = (players[name] or 0) - amount
            end
        else
            print("Action not recognized, try again")
        end
    end

    print("----------")
    local sorted_players = {}
    for name, winning in pairs(players) do
        table.insert(sorted_players,{name = name, winning = winning})

    end
    table.sort(sorted_players,function(a,b) return a.name < b.name end)

    for _,player in ipairs(sorted_players) do
        print(player.name .. " is winning " .. player.winning)
    end
end

--You have an empty bag where you can store and remove words.
--Words can be repeated.
--Removing a word means you only remove it once.
--Trying to remove a non existent word will result in an error.
--At any moment you can be asked for the lexicographically greatest word of the bag and how many times it's in the bag.
--you can also be asked about the smallest word.

function problem2()

end