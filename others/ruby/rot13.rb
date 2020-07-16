#!/usr/bin/env ruby

def rot13(s)
  result = ""
  s.each_char do |c|
    ch = c.downcase
    if c.match(/[a-m]/) then
      result += (c.ord + 13).chr
    elsif c.match(/[n-z]/) then
      result += (c.ord - 13).chr
    else
      result += c
    end
  end
  return result
end

p rot13("HELLO")
p rot13(rot13("Hello"))
