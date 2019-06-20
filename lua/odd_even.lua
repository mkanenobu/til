#!/usr/bin/env lua
num = (arg[1])

if num == nil then
  num = 0
end

if num % 2 == 0 then
	print("even")
else
	print("odd")
end	
