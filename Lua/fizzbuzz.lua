for i=1, 100 do
    if i%15==0 then
        io.write("Fizzbuzz")
    elseif i%5==0 then
        io.write("Buzz")
    elseif i%3==0 then
        io.write("Fizz")
    else
        io.write(i)
    end
    io.write (",")
end

