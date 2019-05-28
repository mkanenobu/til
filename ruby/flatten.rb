#!/usr/bin/env ruby

a = {
  a: 'a',
  b: nil,
  c: 'c',
}

elements = []

a.each do |_, v|
  elements << v
end

pp elements
