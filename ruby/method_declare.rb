#!/usr/bin/env ruby

# Class Method
class Foo
  # 以下二つの宣言は同じ意味
  def self.bar
    puts "Bar"
  end
end

# 外からクラスメソッドを定義
def Foo.baz
  puts "Baz"
end

Foo.bar
Foo::bar


class Hoge
  class << self
    def hoge
      puts "hoge"
    end
  end
end

Hoge.hoge
Hoge::hoge


# Instance Method
class Huga
  def huga
    puts "huga"
  end
end

Huga.new.huga

