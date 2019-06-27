#!/usr/bin/env ruby

a = 'sample'
h = {
  a: '1',
  b: '2',
}

pp h
p h.values


hoge = {}
hoge['key1'] ||= {}
hoge['key1']['ch1'] ||= []
hoge['key1']['ch1'] << 'hoge'
pp hoge
