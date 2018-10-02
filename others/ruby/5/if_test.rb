ad = ARGV[0].to_i
heisei = ad - 1988
if heisei <= 0 then
	print "error\n", "before 1988 is not heisei\n"
else
	puts heisei
end

