#!/usr/bin/env ruby
# frozen_string_literal: true

a = String.new('Hello, World!')
b = String.new('Hello, World!')

a == b && p('Match')

# Class detect
puts a.class

class SampleClass
  @val1 = 0
  def initialize(val1)
    @val1 = val1
  end

  def set_val1(val1)
    @val1 = val1
  end

  def put_val1
    puts @val1
  end
  attr_reader :val1
end

sc = SampleClass.new(100)
sc.put_val1 # 100
sc.set_val1(13)
sc.put_val1 # 13
sc.val1

l = [1, 2, 3]
# 特異メソッド
def l.cubes
  map { |i| i**3 }
end

p l.cubes
