#!/usr/bin/env ruby

arr = [['one', 1], ['two', 2], ['three', 3]]
hash = arr.to_h
pp hash

arr2 = {
  a: {
    hoge: 1,
    huga: 2,
  },
  b: {
    hoge: 3,
    huga: 4,
  },
  c: {
    hoge: 5,
    huga: 6,
  },
}

pp arr2.values.map {|e| e[:hoge]}
