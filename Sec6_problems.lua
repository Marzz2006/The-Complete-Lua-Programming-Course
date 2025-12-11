print("Section 6 Problems")

print() -- blank string

-- Arrays

local inputArray = {3,1,2,2,4,5,3}
local inputArray2 = {3,1,2,2,5,3,8}

local array1 = {3,1,5,2,7}
local array2 = {5,2,9,7}

local nativesSpecies = {
    ["Seahorse"] = {"Seagrass","Small Size"},
    ["Clownfish"] = {"Anemone","Bright Colors"}
}
local invasiveSpecies = {
    ["Lionfish"]={"SPines","Venomous Size"},
    ["Octopus"]={"Invasive","Disruptive Colors"},
    ["Jellyfish"]={"Small Size","Bright Colors"}
}

print("Problem: 1. Find Unique Elements")

--Problem1

-- We are given an array of integers, and we need to find and print all the unique elements in the array.
-- Write a Lua Function findUniqueElements(array) that takes an array as input and returns a set containing all the unique elements in the array.

--example array: {3,1,22,4,5,3}
--example output: 1,2,3,5,4

function findUniqueElements(array)
    local uniqueSet = {}

    for i = 1, #array do
        uniqueSet[array[i]] = true
    end

    return uniqueSet
end

local uniqueSet = findUniqueElements(inputArray2)
for element in pairs(uniqueSet) do
    print(element)
end

print() -- blank string

print("Problem: 2. Common Elements")

--Problem 2

-- We are givin wo arrays of integers, and we need to find and print all the elements that are common in both arrays.
-- Write a Lua function commonElements(array1, array2) that takes two arrays as input and returns a set containing 
--all the elements that are common in both array's

--example: array1 = {3,1,5,2,7} : array2 = {5,2,9,7}
--expected output: 2,5,7

function commonElements(array1, array2)
    local set1 = {} --set for the first array
    local commonSet = {}

    --populate set1 with elements from the first array
    for i = 1, #array1 do
        set1[array1[i]] = true
    end

    for i = 1, #array2 do
        if set1[array2[i]] then
            commonSet[array2[i]] = true
        end
    end

    return commonSet
    
end

local solutionSet = commonElements(array1, array2)

local sorted = {}
for element in pairs(solutionSet) do
    table.insert(sorted,element)
end

table.sort(sorted)

for _,elem in ipairs(sorted) do
    print(elem)
end

print() -- blank string

print("Problem: 3. Marine Species")

-- Problem 3

-- You are working as a marine biologist and have been given a list of species found in a marine ecosystem.
-- Some species are native to the ecosystem, while others are invasive and harmful.
-- Write a Lua function identifyInvasiveSpecies(native,invasive)that takes two tables as input:
-- One for native species and their characteristics and another for invasive species and their characteristics.
-- The function should return a set of invasive species that have at least one characteristics not found in any native species.

--output: Lionfish, Octopus

function identifyInvasiveSpecies(native,invasive)
    local identifiedInvasives = {}
    for invasiveName, invasiveCharac in pairs(invasive) do
        local hasNewCharac = false
        for _, charac in ipairs(invasiveCharac) do
            local foundInNative = false
            for _, nativeCharac in pairs(native) do
                for _, nativCh in ipairs(nativeCharac) do
                    if nativCh == charac then
                        foundInNative = true
                        break
                    end
                end
                if foundInNative then
                    break
                end
            end
            if not foundInNative then
                hasNewCharac = true
                break
            end
        end
        if hasNewCharac then
            identifiedInvasives[invasiveName] = true
        end
    end
    return identifiedInvasives
end

local invSpec = identifyInvasiveSpecies(nativesSpecies, invasiveSpecies)

for species in pairs(invSpec) do
    print(species)
end