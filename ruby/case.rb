#!/usr/bin/env ruby

n = 4

case n
when 1,2,3
  p 'n is 1 or 2 or 3'
when 4,5,6
  p 'n is 4 or 5 or 6'
end

case n
when *[1,2,3]
  p 'n is 1 or 2 or 3'
when *[4,5,6]
  p 'n is 4 or 5 or 6'
end



a = false
b = true
c = true

case
when a
  p 'a is true'
when b
  p 'b is true'
when c
  p 'c is true'
end
