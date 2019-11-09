#!/usr/bin/env ruby

class Hoge
  def a=(param)
    @a = param * 3
  end

  def puts_a
    puts "a is #{@a}"
  end
end

h = Hoge.new
a = h.a = 'aa'
h.puts_a
puts a
