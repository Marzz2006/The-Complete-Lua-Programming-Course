function relatedsum(n)
    local numStr = tostring(n)
    local len  = #numStr -- amount of digits
    local halfLen = len / 2

    local sumFirst = 0
    local sumSecond = 0

    for i = 1, halfLen do
        sumFirst = sumFirst + tonumber(numStr:sub(i,i))
    end
    for i = halfLen + 1, len do
        sumSecond = sumSecond + tonumber(numStr:sub(i,i))
    end

    if sumFirst < sumSecond then
        return sumFirst .. " < " .. sumSecond
    elseif sumFirst > sumSecond then
        return sumFirst .. " > " .. sumSecond
    else
        return sumFirst .. " = " .. sumSecond
    end
end