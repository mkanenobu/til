require "date"
birth = ARGV[0]
days = Date.today - Date.new(1994,10,18)
puts days.to_i
