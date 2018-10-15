#!/usr/bin/env lua5.3

local cor = coroutine.create(
  function(init)
    if init == nil
      then init = 0
    end

    local i = init
    while i < 10 do
      coroutine.yield(i)
      i = i + 1
    end

    assert(false)
    return -1
  end
)
print(coroutine.status(cor))

repeat
  local bStat, vRet = coroutine.resume(cor, 5)
  if bStat then
    print("->", vRet)
  else
    print("assert! -> ", vRet)
  end
until coroutine.status(cor) == "dead"
