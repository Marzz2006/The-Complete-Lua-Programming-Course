-- A set is a data structure that represents an unordered collection of distinct elements.
-- the key characteristic of sets is that they do not allow duplicate elements,
-- meaning each element can only appear once within a set

-- The main operations associated with sets are:
-- Add(Insert): This operation adds a new element to the set.
-- If the element is already present, it will not be added again since sets do not allow duplicates

-- Remove(Delete): This operation removes a specific element from the set if it exists.
-- if the element is not present, the operation ahs not effect.

-- Contains(Membership Test): This operation checks whether a specific element is present in the set or not.
-- It returns a boolean value indicating the result.

--Size(Cardinality): This operations returns the number of elements in the set,
-- which is also referred to as the cardinality of the set.

-- A set can be represented as a table in Lua, where ther keys of the table represent the elements of the set.
-- Since keys in a table are unique, duplicates are automatically handled.

--Function to create a new set
function newset()
    local set = {}
    return set
end

-- Functioon to check if sn element exists in the set
function contains(set, element)
    return set[element] ~= nil
end

-- Function to add an element to the set
function add(set, element)
    set[element] = true
end

-- Function to remove am element from the set
function remove(set, element)
    set[element] = nil
end

-- Function to get the sixe of the set
function size(set)
    local count = 0
    for _ in pairs(set) do
        count = count + 1
    end

    return count
end
