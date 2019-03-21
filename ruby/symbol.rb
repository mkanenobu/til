#!/usr/bin/env ruby

# Symbol
# 内部では整数として扱われる
# 文字列自体は必要ではない場合に使用される

a = :test
b = :test
c = :sample

a == b && puts('true')
p c
