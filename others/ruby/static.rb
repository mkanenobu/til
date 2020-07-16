#!/usr/bin/env ruby

class Hoge
  def hoge
    p 'hoge'
  end
end

module Huga
  def huga
    p 'huga'
  end
end

# Hoge.hoge
Huga.huga
