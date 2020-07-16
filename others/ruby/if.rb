#!/usr/bin/env ruby

def f1(b)
  return if b
  pp "test"
end

def f2
  l = [1,2,3,4,5]
  l.each do |e|
    # ガード
    # e == 3がtrueの場合のみnextが評価される
    next if e == 3
    pp e
  end
end

pp f1(true)
pp f1(false)

f2
