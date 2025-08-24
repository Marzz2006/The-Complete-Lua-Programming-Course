require("math")

function is_prime(number)
   if number < 2 then
    return false
   end 
   for i = 2, math.sqrt(number) do
        if number % i == 0 then
            return false
        end
   end
   return true
end

function findprime(n)
    for i = n-1,2, -1 do
        if is_prime(i) then
            return i
        end
    end
    return nil
end

