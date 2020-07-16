#!/usr/bin/env ruby

obj = {
  one: 1,
  two: 2,
  three: 3,
}

obj2 = obj.each_with_object({}) do |(key, val), ob|
  ob[key] = val
end

pp obj2
