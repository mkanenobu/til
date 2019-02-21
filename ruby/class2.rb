#!/usr/bin/env ruby

class Person
  # コンストラクタ
  def initialize(name, age)
    @name, @age = name, age
  end

  # 比較演算子`<=>`のオーバーライド
  def <=>(person)
    @age <=> person.age
  end

  def to_s
    "#{@name} (#{@age})"
  end

  # attrはインスタンス変数の入出力を司る
  attr_reader :name, :age
  # 明示的なreturnがない場合、最後に評価された式が返り値になる
end

persons = [
  Person.new("John", 20),
  Person.new("Markus", 63),
  Person.new("Ash", 42)
]

# putsはオブジェクトのto_sメソッドを呼び出して出力
puts persons.sort.reverse
