#!/usr/bin/env ruby

require 'date'

date_string = '1990-01-01'

def parse_date(s)
  format = "%Y-%m-%d"
  Date.strptime(s, format)
end

pp parse_date(date_string)
