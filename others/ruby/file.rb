#!/usr/bin/env ruby

p Dir.getwd
p File.absolute_path("..")

sample = ""
File.open("sample.txt", "r") do |f|
  sample = f.read
end
p sample


File.open("sample.txt", "r") do |f|
  f.each_line { |line|
    puts line
  }
end


arr = ["Hello", "World", "!"]
File.open("sample2.txt", "w") do |f|
  arr.each { |s| f.puts(s) }
end
