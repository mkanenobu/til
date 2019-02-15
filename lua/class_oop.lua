#!/usr/bin/env lua5.3

local classA = {
  value1 = "return string",
  value2 = 123,
  value3 = 0,
}

function classA:getVal1()
  return self.value1
end

function classA:addToVal2(n)
  return self.value2 + n
end

function classA:setVal3(m)
  self.value3 = m
end

function classA:getVal3()
  return self.value3
end

print(classA:getVal1())
print(classA:addToVal2(12))

classA:setVal3(10)
print(classA:getVal3())
