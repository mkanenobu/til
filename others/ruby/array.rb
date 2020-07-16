#!/usr/bin/env ruby

arr = []  # or arr = Array.new

arr1 = Array.new(5) {|i| "hoge_#{i}"}

arr1.each {|v| puts "value: #{v}"}

puts ""
# or

arr1.each do |v|
  puts "value: #{v}"
end

arr1.delete_at(0)

p arr1

arr2 = Array.new(5) {|i| i}

p arr2
arr2.delete_if {|v| v < 2 }
p arr2
