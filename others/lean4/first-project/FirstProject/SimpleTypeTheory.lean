-- Simple Type Theory

-- def <項の名前(識別子)> : <項の型> := <項の定義式>
def m : Nat := 54
def b1 : Bool := true
def b2 : Bool := false

-- 項の型をチェックするには #check を使う
#check m -- m : Nat
#check 5 -- 5 : Nat
#check b1 && b2 -- b1 && b2 : Bool
#check b1 || b2 -- b1 || b2 : Bool

-- 項を評価するには #eval を使う
#eval m + 1 -- 55
#eval 5 * 4 -- 20
#eval b1 && b2 -- false

/-
コメントブロック
-/

-- 関数型 `\to` `\r` `\->` と打つと → に変換される、-> でも同じ意味
#check Nat -> Nat
-- 直積型 `\times` と打つと × に変換される
#check Nat × Nat

#check Nat → Nat -> Nat
#check Nat → (Nat -> Nat)  -- これは一つ上と同じ、つまり `->` は右結合

#check Nat.succ -- Nat → Nat
#check (0, 1) -- Nat × Nat
#check Nat.add -- Nat → Nat → Nat

#check Nat.succ 2 -- Nat
#check Nat.add 3 -- Nat → Nat

#check (0.1, 8) -- Float x Nat
-- 直積型の値のインデックスアクセス
#check (0.1, 8).1 -- Float
#check (0.1, 8).2 -- Nat

#eval Nat.succ 2 -- 3
#eval Nat.add 5 2 -- 7
#eval (5, 9).1  -- 5
#eval (5, 9).2  -- 9
#eval Nat.add (10, 7).1 (10, 7).2 -- 17

-- Types as objects 項としての型
-- 型そのものも項で、それぞれの型も型を持つ
#check Nat -- Type
#check Bool -- Type
#check Nat × Nat -- Type
#check Nat -> Nat -- Type

-- 型を表す新しい定数を宣言することも出来る
def a : Type := Nat
def F : Type -> Type := List
def G : Type → Type → Type := Prod

#check a -- Type
#check F -- Type -> Type
#check G -- Type -> Type -> Type
#check F Nat -- Type
#check G Bool -- Type -> Type

-- Typeも型を持つ
-- 型の階層が無限に続く
-- 任意の自然数 n に対して型 Type n が存在する
#check Type -- Type 1
#check Type 1 -- Type 2
#check Type 2 -- Type 3
-- Type は Type 0 の略記法
#check Type 0 -- Type 0

-- ポリモーフィックな型
#check List -- List.{u} (α : Type u) : Type u
#check Prod -- Prod.{u, v} (α : Type u) (β : Type v) : Type (max u v)

-- universe コマンドで多相な項（universe variable）を定義出来る
universe u
def H (a : Type u) : Type u := Prod a a
#check H -- H.{u} (a : Type u) : Type u
-- {}を用いてuniverse parameterを定義出来る
def I.{k} (a : Type k) : Type k := Prod a a
#check I -- I.{k} (a : Type k) : Type k
