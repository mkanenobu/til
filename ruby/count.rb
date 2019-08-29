#!/usr/bin/env ruby

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]

pp arr.count(&:even?)
