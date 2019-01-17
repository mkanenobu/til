#!/usr/bin/env ruby

(1..100).each do |i|
  if i % 15 == 0
    print "FizzBuzz"
  elsif i % 5 == 0
    print "Buzz"
  elsif i % 3 == 0
    print "Fizz"
  else
    print i.to_s
  end
  print ","
end
