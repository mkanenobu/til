#!/usr/bin/env ruby

# 
begin
  p (Integer "string")
rescue ArgumentError
  puts "Argument error"
rescue
  puts "Some error"
ensure
  puts "evaluate alltime"
end

# raise
begin
  raise SyntaxError
rescue SyntaxError
  puts "SyntaxError occurred"
rescue
  puts "some error occurred"
end

# 
num = Integer "a" rescue 10
puts num

# create new Exception
class MyException < StandardError; end
