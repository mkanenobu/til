#!/usr/bin/env ruby

class Base
  def self.hoge
    'hoge'
  end

  def fuga
    'fuga'
  end
end

class Inherit < Base
  def hoge2
    Base.hoge
  end

  def fu
    fuga
  end
end

pp Inherit.new.hoge2
pp Inherit.new.fuga
