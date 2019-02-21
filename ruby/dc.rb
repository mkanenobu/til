#!/usr/bin/env ruby

# Unix 'dc' command inplementation in ruby

stack = []
operaters = ['+', '-', '*', '/', '.s', '.']

# definition new Error, extends StandardError
class StackUnderflowError < StandardError; end

def calc(stack, op)
  if stack.length == 1 then
    raise StackUnderflowError
  end
  tmp1 = stack.pop
  if op == "/" and tmp1 == 0 then
    stack.push(tmp1)
    raise ZeroDivisionError
  end
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
      begin
        calc(stack, op)
      rescue ZeroDivisionError
        puts "Error: Divided by zero"
      rescue StackUnderflowError
        puts "Error: Stack underflow"
      end
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

