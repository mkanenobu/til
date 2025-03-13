-- Implicit Arguments 暗黙の引数

-- 例えばこのような実装があるとする
def Lst := List
namespace Lst
  universe u

  def cons (α : Type u) (a : α) (as : Lst α) : Lst α := a :: as
  def nil (α : Type u) : Lst α := []
  def append (α : Type u) (a b : Lst α) : Lst α := List.append a b
end Lst

#check Lst.cons Nat 0 (Lst.nil Nat) -- Lst Nat
#eval Lst.cons Nat 0 (Lst.nil Nat) -- [0]
def as : Lst Nat := Lst.nil Nat
def bs : Lst Nat := Lst.cons Nat 5 (Lst.nil Nat)
#check Lst.append Nat as bs -- Lst Nat
#eval Lst.append Nat as bs -- [5]

-- それぞれの関数は多相なので毎回型 Nat を渡す必要があり冗長
-- Lst.cons Nat 0 (Lst.nil Nat) について考えると、
-- 第二引数に 0 (Nat)が渡されているので Lst.cons の第一引数には Nat が入ることも、Lst.nil の第一引数に Nat が入ることも推論可能

-- そこで `_` を使うことで型を推論させることが出来る
#check Lst.cons _ 0 (Lst.nil _) -- Lst Nat
#eval Lst.cons _ 0 (Lst.nil _) -- [0]
def cs : Lst Nat := Lst.nil _
def ds : Lst Nat := Lst.cons _ 5 (Lst.nil _)
#check Lst.append _ cs ds -- Lst Nat
#eval Lst.append _ cs ds -- [5]

-- これでもまだ面倒
-- 関数が一般的に文脈から推論出来る引数を取る場合、「この引数は（デフォルトでは）暗黙的に推論して欲しい引数である」ということを明示することが出来る
-- `{}` で囲むことで暗黙の引数とすることが出来る
def Lst2 := List
namespace Lst2
  universe u

  -- 変わったのは最初の引数を `()` で囲んでいたのを `{}` に変えただけ
  def cons {α : Type u} (a : α) (as : Lst2 α) : Lst2 α := a :: as
  def nil {α : Type u} : Lst2 α := []
  def append {α : Type u} (a b : Lst2 α) : Lst2 α := List.append a b
end Lst2

#check Lst2.cons 0 (Lst2.nil) -- Lst2 Nat
#eval Lst2.cons 0 (Lst2.nil) -- [0]
def es : Lst2 Nat := Lst2.nil
def fs : Lst2 Nat := Lst2.cons 5 Lst2.nil
#check Lst2.append es fs -- Lst2 Nat
#eval Lst2.append es fs -- [5]

-- 他の例
namespace Ident
  universe u
  def ident {α : Type u} (x : α) := x
  #check ident
  #check ident 1
  #check ident "hello"
  #check @ident -- {α : Type u_1} → α → α
end Ident

namespace Ident2
  universe u

  section
    -- variable を使ったときも変数を暗黙の引数として指定出来る
    variable {a : Type u}
    variable (x : a)
    def ident := x
  end
end Ident2
