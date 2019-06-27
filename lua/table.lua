#!/usr/bin/env lua5.3

t = {"one", "two", "three", "four", "five"}

-- iterate
-- for [index], [value] in pairs([table]) do
print("for iterate")
for _, v in pairs(t) do
  print(v)
end

-- iterate2
print("while iterate")
i, v = 1, t[1]
while i do
  print(v)
  i, v = next(t, i)
end



t2 = {
  one = 1,
  two = 2,
  three = 3,
}

print("for iterate with index")
for i, v in pairs(t2) do
  print(i)
  print(v)
end

-- acces to table member
print(t2.one)
print(t2["one"])

-- add member to table
t2.four = 4
print(t2.four)
