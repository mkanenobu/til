#!/usr/bin/env ruby

functions = {
  :f1 => lambda do |n|
     n + 1
  end,
  :f2 => lambda do |n|
    n + 2
  end
}

pp functions[:f1].call(3)
