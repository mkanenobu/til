FB = [*(1..10)]
B = [*(1..50)]
F = [*(1..50)]
for i in 1..100 do
	if i / 15 == FB[i/15] then
		print "Fizzbuzz"
	elsif i / 5 == B then
		print "Buzz"
	elsif i / 3 == F then 
		print "Fizz"
	else
		print i
	end
	print " "
end
