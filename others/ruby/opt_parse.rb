#!/usr/bin/env ruby
require "optparse"

params = ARGV.getopts("a:")
pp params
pp ARGV
