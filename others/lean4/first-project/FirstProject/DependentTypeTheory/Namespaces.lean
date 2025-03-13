-- Namespaces 名前空間

-- キーワード namespace を使うと入れ子に出来る階層的な名前空間を作ることができ、その中に定義を入れて定義をグループ化することが出来る

namespace Foo
  def a : Nat := 5
  def f (x : Nat) : Nat := x + 7

  def fa : Nat := f a
  def ffa : Nat := f (f a)

  -- 名前空間の中で宣言された全ての識別子は名前空間の接頭子が付いたフルネームを持つ
  -- 名前空間内では同じ名前空間の接頭子を省略出来る
  -- セクションとは異なり、名前空間は名前が必要（ルートレベルが暗黙的に無名の名前空間である）
  #check a
  #check f
  #check fa
  #check ffa
  #check Foo.fa

  namespace Bar
    -- 名前空間は入れ子に出来る
    def fffa : Nat := f (f (f a))

    #check fffa
  end Bar

  #check Bar.fffa
end Foo

-- これは参照不可
-- #check a
-- #check f

#check Foo.a
#check Foo.f
#check Foo.fa
#check Foo.ffa
#check Foo.Bar.fffa

-- open <名前空間名> を使うと名前空間名を省略した名前を使えるようになる
open Foo

#check a
#check f
#check fa
#check Foo.fa

-- Lean内部でも一部の定義をnamespaceでグループ化している
#check List.nil
#check List.cons
#check List.map

-- 一度閉じた名前空間を再度開くことも出来る
namespace Foo
  def b : Nat := 10
end Foo

-- インポート元の名前空間をインポート先で開くことも出来る
namespace List
  def a : Nat := 5
end List

-- namespaceはデータを整理し、セクションは定義に挿入される変数の宣言を整理するという異なる役割を持つ
-- しかしながら多くの側面でセクションと同様の挙動をする
-- namespace内で variable を使った場合、セクションと同様にその変数のスコープはその namespace 内に限定される
