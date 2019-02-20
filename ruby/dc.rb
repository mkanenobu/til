#!/usr/bin/env ruby

# Unix 'dc' command inplementation in ruby

stack = []
operaters = ['+', '-', '*', '/', '.s', '.']

def calc(stack, op)
  tmp1 = stack.pop
  tmp2 = stack.pop
  stack.push(eval("#{tmp2} #{op} #{tmp1}"))
end

def words(stack, op)
  case op
    when '.s' then
      p stack
    when '.' then
      puts stack.pop()
    else
      calc(stack, op)
  end
end

while true do
  print "> " # prompt
  line = STDIN.gets
  line = line.split(' ')
  line.each do |w|
    if operaters.include?(w) then
      words(stack, w)
    else
      begin
        stack.push(Float w)
      rescue
        puts "Error: Invalid input"
      end
    end
  end
end
