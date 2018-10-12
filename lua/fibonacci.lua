a, b = 0, 1
for i=0, 50 do
	io.write(b .. ", ")
	a, b = b, a + b
end
print()
