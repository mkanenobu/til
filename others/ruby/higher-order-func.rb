#!/usr/bin/env ruby

arr = [1, 2, 3, 4, 5]

arr2 = arr.map do |e|
  3 if e != 3
end
pp arr2

# arr自身が戻り値
arr2 = arr.each do |e|
  e * 2
end
pp arr2
