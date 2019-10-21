#!/usr/bin/env ruby

class A
  def self.hoge
    pp fuga
  end

  def self.fuga
    'aaa'
  end
end

class B
  def hoge
    pp fuga
  end

  def fuga
    'aaa'
  end
end

A.hoge
b = B.new
b.hoge
