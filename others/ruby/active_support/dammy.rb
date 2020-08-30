#!/usr/bin/env ruby
# frozen_string_literal: true
require "active_support/all"
require "json"

obj = {
  hoge: "hoge"
}

print JSON.pretty_generate(obj)
