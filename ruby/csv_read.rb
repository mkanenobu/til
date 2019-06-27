#!/usr/bin/env ruby

require 'csv'

CSV.foreach('./csv_sample.csv') do |row|
  pp row
end
