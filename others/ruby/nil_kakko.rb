#!/usr/bin/env ruby

class NilClass
  def []
    nil
  end
end

p nil[]
