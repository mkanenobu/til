#!/usr/bin/env ruby

p Dir.getwd
p File.absolute_path("..")

File.open("sample.txt", "r") do |f|
  puts f.read
end

arr = ["Hello", "World", "!"]
File.open("sample2.txt", "w") do |f|
  arr.each { |s| f.puts(s) }
end
