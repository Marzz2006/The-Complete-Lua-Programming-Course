-- Treasure Map 1
-- Output PR1: yes
-- Output PR2: 4
-- sp = 5,3
local tm1 = {
    "..t...",
    "..XXX.",
    "......",
    "tX..X.",
    ".X..Xt",
    ".XX...",
    "..t..."
    }

--Treasure Map 2
-- Output PR1: no
-- Output PR2: 0
-- sp = 4,1
local tm2 = {
    "..t...X...",
    ".....X..t.",
    "XXXXX.X...",
    ".......X.t"
}

--Treasure Map 3
-- Output PR1: yes
-- Output PR2: 2
-- sp = 5,5
local tm3 = {
    ".......",
    ".XXXXXt",
    ".X...Xt",
    ".X.X.XX",
    "...X.Xt"
}

local tm = tm3
local pr = 1

local r = 0
local c = 0

if tm == tm1 then
    r = 5
    c = 3
elseif tm == tm2 then
    r = 4
    c = 1
elseif tm == tm3 then
    r = 5
    c = 5
end


-- Problem 1
-- Write a program that, given as map with treasures and obstacles, 
-- tells if it is possible to reach treasure from a given initial position.
-- The allowed movements are horizontal or vertical, but not diagonal.

local dirs = {{1,0},{-1,0},{0,1},{0,-1}}
local tc = 0

local function is_valid(G,i,j)
    return i >= 1 and i <= #G and j >=1 and j <= #G[i]
end

local function dfs_treasure(G,i,j,x)
    if x == 1 then
        if G[i][j] == 'X' then
            return false
        end
    elseif x == 2 then
        if G[i][j] == 'X' then
            return tc
        end
    end
    

    if x == 1 then
        if G[i][j] == 't' then
            return true
        end 
    elseif x == 2 then
        if G[i][j] == 't' then
            tc = tc + 1
        end        
    end

    G[i][j] = "X"

    if x == 1 then
        for _,d in ipairs(dirs) do
            local ni = i + d[1]
            local nj = j + d[2]
            if is_valid(G,ni,nj) and dfs_treasure(G, ni, nj, x) then
                return true
            end
        end
        return false
    elseif x == 2 then
        for _,d in ipairs(dirs) do
            local ni = i + d[1]
            local nj = j + d[2]
            if is_valid(G,ni,nj) then
                dfs_treasure(G, ni, nj, x)
            end
        end
        return tc
    end
end

local G = {}
local prev_len

--for i = 1,n do
for i = 1,#tm do
    local rs = tm[i]
    if prev_len and #prev_len ~= #rs then
        print("Treasure Map Invalid. All lines must be same length")
        G={}
        break
    end
    local row = {}
    local rowStr = rs
    for j = 1,#rowStr do
        row[j] = rowStr:sub(j,j)
    end
    table.insert(G,row)
    prev_len = rs
end



if #G > 0 and pr == 1 then
    local treasure
    treasure = dfs_treasure(G,r,c,pr)

    if treasure then
        print("yes")
    else
        print("no")
    end
end

-- Problem 2
-- Write a program that, given a map with treasures and obstacles, computes the number of treasures than can be reached
-- from a given initial position. The allowed movements are horizontal or vertical, but not diagonal. 
-- If needed, passing over treasures is allowed.

if #G > 0 and pr == 2 then
    print("Number of available treasures: ",dfs_treasure(G,r,c,pr))
end


