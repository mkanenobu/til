#!/usr/bin/env ruby

a = String.new("Hello, World!")
b = String.new("Hello, World!")

if a == b then
  p "Match"
end

# Class detect
puts a.class()

class SampleClass
  def setVal1(val1)
    @@val1 = val1
  end

  def putVal1()
    puts @@val1
  end
end

SampleClass.new.setVal1(13)
SampleClass.new.putVal1()
