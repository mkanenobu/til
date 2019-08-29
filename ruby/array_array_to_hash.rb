#!/usr/bin/env ruby

source_array = [
  [1, 'one', '1st'],
  [2, 'two', '2nd'],
  [3, 'three', '3rd'],
]

array = source_array.map do |arr|
  { arr[1] => arr }
end
pp array

array = source_array.each_with_object({}) do |row, acc|
  acc[row[1]] = row
end
pp array
