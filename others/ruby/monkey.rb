#!/usr/bin/env ruby

class Integer
  def to_b
    !self.zero?
  end
end

pp 0.to_b
pp 1.to_b
