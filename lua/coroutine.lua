#!/usr/bin/env lua5.3

local cor = coroutine.create(
  function(n)
    if n == nil then
      n = 0
    end

    local i = n
    while i > 10 do
      -- 中断, 次にresumeされたときはyieldの次の行から再開される
      -- yieldに引数を与えるとresumeの第二返り値以降になる(この場合valReturn)
      coroutine.yield(i)
      i = i - 1
    end

    assert(false)
    return -1
  end
)

repeat
  local blnStatus, valReturn = coroutine.resume(cor, 30)
  if blnStatus then
    print("->", valReturn)
  else
    print("assert! ->", valReturn)
  end
  -- assert, returnでcoroutineはdead状態になる
until coroutine.status(cor) == "dead"
