#!/usr/bin/env ruby

# Local variable
2.times {
  p defined?(v)
  v = 1
  p v   # ここまでがvのスコープ
}

v = 1 if false # 代入はされないが宣言は有効
p defined?(v)  # -> local-variable
p v            # -> nil

# Instance variable
# '@'で始まる変数はインスタンス変数であり、そのクラス、またはサブクラスのメソッドから参照できる。

# Class variable
# '@@'で始まる変数はクラス変数であり、クラス定義中で定義され、クラスの特異メソッド、インスタンスメソッドなどから参照、代入できる。クラスの外から直接参照することはできない。
class Foo
  @@foo = 123
  puts @@foo

  def self.bar
    puts @@foo
  end
end

class Baz < Foo
  puts @@foo += 1
end

# クラス変数がクラス自身のインスタンス変数と異なるのは、
# サブクラスから参照、代入が可能
# インスタンスメソッドから参照、代入が可能
