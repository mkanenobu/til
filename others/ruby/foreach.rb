#!/usr/bin/env ruby

require 'csv'

CSV.foreach('cities.csv', headers: true).with_index(1) do |row, index|
  puts "#{index}: #{row}"
end
