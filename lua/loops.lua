#!/usr/bin/env lua5.3

-- Loops

-- while
i = 0
while i < 10 do
  print(i)
  i = i + 1
end

-- repeat
i = 0
repeat
  print(i)
  i = i + 1
until i == 1

-- for
for i = 0, 10 do
  print(i)
end

-- for step
for i = 0, 10, 2 do
  print(i)
end

-- for with table
t = {5,4,3,2,1}
for i,v in pairs(t) do
  print("index: ", i)
  print("value: ", v)
end

