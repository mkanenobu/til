#!/usr/bin/env ruby

i = 0
while true do
  i += 1
  p i
  if i == 10
    break
  end
end

@i = 0
def inc
  @i += 1
  @i < 10
end

pp 'i is smaller than 10' while inc
