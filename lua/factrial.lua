#!/usr/bin/env lua5.3

function factorial(n)
  res = 1
  for i = 2, n do
    res = res * i
  end
  return res
end

print(factorial(100))
