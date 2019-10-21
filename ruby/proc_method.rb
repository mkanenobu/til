#!/usr/bin/env ruby

def by_two(n)
  n * 2
end

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]

arr.map(&method(:puts))
pp arr.map(&method(:by_two))

pp arr.map { |it| 2**it }
pp arr.map(&2.method(:**))
