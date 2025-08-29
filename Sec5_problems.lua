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

--Problem 2
--You have an empty bag where you can store and remove words.
--Words can be repeated.
--Removing a word means you only remove it once.
--Trying to remove a non existent word will result in an error.
--At any moment you can be asked for the lexicographically greatest word of the bag and how many times it's in the bag.
--you can also be asked about the smallest word.

local words = {}

function problem2()
    while true do
        local line = io.read()
        local query, word = line:match("(%S+)%s*(%S*)")

        if query == "store" then
            insertOrUpdate(word)
        elseif query == "maximum" then
            local maxWord
            for word,_ in pairs(words) do
                if not maxWord or word > maxWord then
                    maxWord = word
                end
            end
            if not maxWord then
                print("Indefinite Maximum")
            else
                print("Maximum Word: " .. maxWord .. ": " .. words[maxWord] .. " time(s).")
            end
        elseif query == "minimum" then
            local minWord
            for word,_ in pairs(words) do
                if not minWord or word < minWord then
                    minWord = word
                end
            end
            if not minWord then
                print("Indefinite Minimum")
            else
                print("Minimum Word: " .. minWord .. ": " .. words[minWord] .. " time(s).")
            end
        elseif query == "delete" then
            if words[word] then
                if words[word] > 1 then
                    words[word] = words[word] - 1
                else
                    words[word] = nil
                end
            end
        elseif query == "stop" then
            break
        end
    end
    for word,count in pairs(words) do
        print(word .. " : " .. count)
    end

end

function insertOrUpdate(word)
    if words[word] then
        words[word] = words[word] + 1
    else
        words[word] = 1
    end
end

--Problem 3
-- Given an input sequence of a code and a word, of the code is a we must increment the frequency of that follows,
--and if the code is f we must write to standard output the frequency of the word that follows.
--(in part of the sequence read until then)
--If the word does not exist, the frequency is zero.

-- refactored problem parameters by AI
-- Process a sequence of (code, word) pairs:
-- - If code is 'a', increment the word's frequency.
-- - If code is 'f', print the current frequency of that word.
-- Frequencies are based on all inputs seen so far; unseen words have frequency 0.

local wordFreq = {}

function problem3()
    while true do
        local line = io.read("*line")
        if not line then
            break
        end

        local code, word = line:match("(%a) (%a+)")
        if code and word then
            if code == "a" then
                wordFreq[word] = (wordFreq[word] or 0) + 1
            elseif code == "f" then
                print(wordFreq[word] or 0)
            end
        end
    end
end