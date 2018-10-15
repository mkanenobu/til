#!/usr/bin/env lua5.3

local f = coroutine.create(
  function(n)
    local i = 0
    while i < 10 do
      coroutine.yield(i)
      i = i + 1
    end
    return -1
  end
)


repeat
  local status, res = coroutine.resume(f, 10)
  if status then
    print(res)
  else
    print(res)
  end
until coroutine.status(f) == "dead"
