#!/usr/bin/env ruby

hash = {
  first: '1',
  second: '2',
  third: '3',
}

params = %i(first second)
pp hash.slice(*params)
