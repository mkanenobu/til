#!/usr/bin/env ruby
require 'readline'

input = ''
while str = Readline.readline('> ', true)
  input << str
end

pp input
