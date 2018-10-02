prime_list = {2}

for x = 3, 100, 2 do
	a = true
	for y = 1, #prime_list do
		z = prime_list[y]
		if x % z == 0 then
			a = false
			break
		end
	end
	if a then
		table.insert(prime_list, x)
	end
end

for x = 1, #prime_list do
	io.write(prime_list[x])
	io.write(" ")
end

print()
