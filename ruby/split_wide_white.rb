#!/usr/bin/env ruby

def split_white(value)
  array = value.split(/\p{blank}/, 2)
  array.map do |s|
    s.gsub(/^[　\s]*(.*?)[　\s]*$/, '\1') # 行頭末尾の空白を削除
  end
end

pp split_white('abc　d ')

