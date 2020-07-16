#!/usr/bin/env ruby

require 'json'

message = "ほげ
ほげ"
hash = {
  message: message,
}.to_json

puts hash
