#!/usr/bin/env ruby

a = String.new("Hello, World!")
b = String.new("Hello, World!")

if a == b then
  p "Match"
end

# Class detect
puts a.class()

class SampleClass
  @@val1 = 0
  def initialize(val1)
    @@val1 = val1
  end

  def setVal1(val1)
    @@val1 = val1
  end

  def putVal1()
    puts @@val1
  end
end

sc = SampleClass.new(100)
sc.putVal1() # 100
sc.setVal1(13)
sc.putVal1() # 13


l = [1,2,3]
# 特異メソッド
def l.cubes
  return self.map{|i| i ** 3}
end

p l.cubes

