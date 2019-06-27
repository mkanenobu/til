#!/usr/bin/env ruby

complex_hash = {
  hoge: [
    '1-1',
    '1-2',
    '1-3',
  ],
  huga: [
    '2-1',
    '2-2',
    '2-3',
  ],
}

a =  complex_hash.map do |key, value|
  if key == :hoge
    "hogehoge#{value.join(',')}"
  else
    value.join(',')
  end
end

pp a
