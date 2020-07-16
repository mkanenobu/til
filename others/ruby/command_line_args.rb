#!/usr/bin/env ruby

if __FILE__ == $PROGRAM_NAME
  puts "File name is #{$0}"

  ARGV.each_with_index do |arg, i|
    puts "ARGV[#{i}]: #{arg}"
  end

  arg1 = ARGV[0].to_i
  arg2 = ARGV[1].to_i

  if arg1 && arg2 then
    puts arg1 + arg2
  end
end
