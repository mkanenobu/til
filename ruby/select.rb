#!/usr/bin/env ruby

arr = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

arr.select! do |_e|
  nil
end

pp arr
