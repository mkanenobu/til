#!/usr/bin/env ruby

a ||= 'sample1 '
a << 'aaa'

a ||= 'hogehoge' # 代入されない

pp a
