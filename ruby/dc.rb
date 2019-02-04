#!/usr/bin/env ruby

# Unix 'dc' command inplementation in ruby

stack = []
operaters = ['+', '-', '*', '/', '.s', '.']

while true do
  print "> " # prompt
  line = STDIN.gets
  line = line.split(' ')
  line.each do |w|
    if operaters.include?(w) then
      case w
      when '+' then
        tmp = stack.pop
        tmp = tmp + stack.pop
        stack.push(tmp)
      when '-' then
        tmp = stack.pop
        tmp = tmp - stack.pop
        stack.push(tmp)
      when '*' then
        tmp = stack.pop
        tmp = tmp * stack.pop
        stack.push(tmp)
      when '/' then
        tmp = stack.pop
        tmp = stack.pop / tmp
        stack.push(tmp)
      when '.s' then
        p stack
      when '.' then
        p stack.pop()
      end
    else
      stack.push(w.to_i)
    end
  end
end
