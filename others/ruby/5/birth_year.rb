age = ARGV[0].to_i
require "date"
today = Date.today
birth = today.year - age 
puts birth

