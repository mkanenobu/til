#!/usr/bin/env ruby

val = 1

# メソッド内から外の変数を参照できない
def addOne(n)
  n + val
end

pp addOne(10)
