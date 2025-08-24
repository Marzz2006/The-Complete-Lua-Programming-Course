os.execute("cls")

function ArrayExample()
    local a = { } -- new array
        for i = 1, 1000 do
            a[i] = 0
        end
    local squares = {1,4,9,16,25,36,49,64,81}
    print(#a)
    print(#squares)
end

function Matrices()
    local matrix = { }
    for i = 1, 100 do
        for j = 1, 300 do
            matrix[i][j] = 0
        end
    end
end

local matrix1 = {
    {1,1,3},
    {4,5,6}
}

local matrix2 = {
    {7,8,9},
    {10,11,12}
}

function AddMatrices(m1,m2)
    local result = {}
    for i = 1, #m1 do
        result[i] = {}
        for j = 1, #m1[i] do
            result[i][j] = m1[i][j] + m2[i][j]
        end
    end
    return result
end

function SumMatrix()
    local sumMatrix = AddMatrices(matrix1,matrix2)
    for i = 1, #sumMatrix do
        print(table.concat(sumMatrix[i],", "))
    end
end