--A dictionary is a general-purpose data structure for storing a group of objects
--A dictionary has a set of keys and each key has a single associated value.
--When presented with a key the dictionary will return the associated value.
--A dictionary is also called a map in differed programming languages.

--The keys in a dictionary must be simple types(such as integers or strings) while the value can be of any type.
--Dictionaries are often implemented as hash tables.
--Keys in a dictionary must be unique an attempt to create a duplicate key will typically overwrite the existing value for that key.

--Dictionary is an abstract data structure that supports the following operations:
--search(K key) returns the value associated with the given key
--insert(K key, V value)
--delete(K key)

function dict_exmp()
    results = {
        Charlie = 8,
        Anna = 7,
        Michael = 5,
        Luna = 9,
        Tom = 6
    }
end

function dict_exmp2()
    local map = {}

    map["key1"] = "value1"
    map["key2"] = "value2"
    map["key3"] = 51

    print(map["key3"])
    print(map["key1"])

    if map["key2"] then
        print(map["key2"])
    end

    map["key1"] = "Updated_Value1"
    print(map["key1"])
end