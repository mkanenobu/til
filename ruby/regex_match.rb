#!/usr/bin/env ruby

s = "string"

# 正規表現リテラル
re = /str(.)(.)/

# match
# マッチした場合にはMatchDataオブジェクト、しなかった場合はnilを返す
puts re.match(s)

pattern = /a{3}/
# return bool
p pattern === 'aaa'

