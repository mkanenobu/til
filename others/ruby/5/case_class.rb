array = [ "a", 1, nil ]
array.each do |item|
	case item
	when String
		puts "Item is a String."
	when Numeric
		puts "Item is a Numeric."
	else
		puts "Item is a something."
	end
end
