#!/usr/bin/env ruby

def f(options)
  pp options[:hoge]
end

f(hoge: "option")
