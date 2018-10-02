file = File.open(ARGV[0])
file.each_line do |line|
	next if /^\s*$/ =~ line
	next if /^#/ =~ line #
	puts line
end
file.close
