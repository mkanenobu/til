#!/usr/bin/env ruby

module Hoge
  def hello
    puts 'Hello, World!'
  end
  module_function :hello
end

module Hoge
  hello
end
