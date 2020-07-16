#!/usr/bin/env ruby

pattern = /\p{Katakana}+/
p 'ｶﾀｶﾅ'.match(pattern).to_a


pattern = /IgnoreCase/i
p pattern === 'ignorecase'

