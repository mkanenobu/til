#!/usr/bin/env ruby

def recursive_freeze(obj)
  obj.freeze
  if obj.is_a?(Array)
    obj.each { |element| recursive_freeze(element) }
  elsif obj.is_a?(Hash)
    obj.each { |_, val| recursive_freeze(val) }
  end
end

arr = [
  { index: 1 },
  { index: 2 },
  { index: 3 },
  { index: 4 },
  { index: 4 },
  { index: 6 },
]
arr = recursive_freeze(arr)
pp arr
