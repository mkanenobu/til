#!/usr/bin/env ruby

arr = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 2, 9],
]

arr = arr.each_with_object([]) do |ar, acc|
  acc << ar[1]
end

pp arr
