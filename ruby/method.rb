#!/usr/bin/env ruby

def has_one_arg(n)
  p n
end

def has_two_arg(n, m=nil)
  p n
  unless m.nil?
    p m
  end
end

has_one_arg('aaa')
