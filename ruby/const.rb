#!/usr/bin/env ruby

# 定数参照の優先順位
class Foo
  Const = 'foo'
end

class Bar
  Const = 'Bar'
  class Baz < Foo
    p Const  # -> "Bar" 外側の定数
    # 親クラスの定数は明示的に指定しなければ見えない
    p Foo::Const # -> "Foo"
  end
end
