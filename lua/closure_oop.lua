#!/usr/bin/env lua5.3

local function SampleClass(arg)
  local self = {
    val1 = "string",
    val2 = arg
  }

  -- public
  function self.getVal1()
    return self.val1
  end

  -- private
  local function getVal2()
    return self.val2
  end

  function self.printVal2()
    print(getVal2())
  end

  return self
end

local instance = SampleClass(123)
print(instance.getVal1())
instance.printVal2()

