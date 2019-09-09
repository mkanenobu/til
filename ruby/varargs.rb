#!/usr/bin/env ruby

def f(*args)
  args.each do |elem|
    pp elem
  end
end

f(1, 2, 3)
f([1, 2, 3])
