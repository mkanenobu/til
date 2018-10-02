num = range(1 .. 100)
fb = {'Fizz','Buzz'}
for i = 1, 100, 1 do
	if i / 15 == 0 then
		io.write(fb[1]..fb[2])
	elseif i % 5 == 0 then
		io.write(fb[2])
	elseif i % 3 == 0 then
		io.write(fb[1])
	else
		io.write(i)
	end
	io.write(",")
end
