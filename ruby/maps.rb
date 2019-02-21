#!/usr/bin/env ruby

l = [1,2,4,10]

# Pure
p l.map {|i| i * 2}

# Side effected
l.map! {|i| i * i}
p l
