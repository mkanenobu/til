#!/usr/bin/env ruby

def rot13(s)
  codes = []
  s.each_char do |c|
    # get ascii code
    code = c.ord + 13
    if (code > 91 and code < 103) or (code > 122 and code < 135) then
      code -= 26
    end
    codes.push(code)
  end
  returnString = ""
  codes.each do |a|
    returnString += a.chr
  end
  return returnString
end

p rot13("HELLO")
p rot13(rot13("Hello"))
