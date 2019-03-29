#!/usr/bin/env ruby

s = 'stringstring'
# replace all
s.gsub!('st', 'ika')
puts s

s = 'stringstring'
# replace first match
s.sub!('st', 'ika')
puts s
