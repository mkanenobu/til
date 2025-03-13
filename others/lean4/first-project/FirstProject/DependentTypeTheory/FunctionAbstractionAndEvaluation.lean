-- Function Abstraction and Evaluation 関数抽象と評価

-- ラムダ関数
-- fun などを使うことで式から関数
-- fun (<入力引数の名前> : <入力引数の型名>) => <関数の出力を定義する式>
-- もしくは λ (<入力引数の名前> : <入力引数の型名>) => <関数の出力を定義する式>
-- 引数の括弧は省略可能
#check fun (x : Nat) => x + 2
#check λ (x : Nat) => x + 2
-- x は Nat 型に推論される
#check fun x => x + 2 -- Nat → Nat

-- 要求されたパラメータを渡すことでラムダ関数を評価することが出来る
#eval (fun x : Nat => x + 5) 10 -- 15

-- これらの式は表記が異なるだけでLeanは全て同じ式と解釈する
#check fun x : Nat => fun y : Bool => if not y then x + 1 else x + 2
#check fun (x : Nat) (y : Bool) => if not y then x + 1 else x + 2
#check fun x y => if not y then x + 1 else x + 2

-- 関数の例
-- toStringは組み込み関数
def natToString (n : Nat) : String := toString n
def isStringEmpty (s : String) : Bool := s.length = 0

#check fun x : Nat => x -- Nat -> Nat
#check fun x : Nat => true -- Nat -> Bool
#check fun x : Nat => isStringEmpty (natToString x) -- Nat -> Bool
#check fun x => isStringEmpty (natToString x) -- Nat -> Bool

-- 入力引数として関数を与えることも出来る
#check fun (g : String -> Bool) (f : Nat -> String) (x : Nat) => g (f x) -- (String -> Bool) -> (Nat -> String) -> Nat -> Bool
-- 型を入力引数として与えることも出来る
#check fun (a b c : Type) (g : b -> c) (f : a -> b) (x : a) => g (f x) -- (a b c : Type), (b -> c) -> (a -> b) -> a -> c

def a := 10
-- 関数の入力引数の束縛変数のスコープは関数内のみで、関数外に同名の定数が定義されていても相互に影響しない
#eval (fun a => a + 1) 6 -- 7

-- 関数の定義

-- defは名前付きの新しい項を宣言するので以下のようにして関数の定義が出来る
-- def <関数の名前> (<入力引数の名前> : <入力引数の型>) : <出力の型> := <出力を定義する式>
def double (x : Nat) : Nat :=
  x + x
#eval double 3 -- 6

-- 名前付きのラムダ関数と考えることも出来る
-- 以下はdoubleと同じ結果を得られる
def double2 : Nat -> Nat :=
  fun x => x + x
#eval double2 3 -- 6

-- 型を推論可能であれば型宣言を省略することも出来る
-- 以下は double2 と同じだがラムダ関数側に十分な型情報があるので double3 の型宣言を省略出来る
def double3 := fun (x : Nat) => x + x

-- defは単に値に名前をつけるために使ってもよい
def pi := 3.14

-- 複数の入力パラメータを取れる
def add (x y : Nat) := x + y
-- 下は add と等価
def add2 (x : Nat) (y : Nat) := x + y

-- コントロールフロー
def greater (x y : Nat) : Nat :=
  if x > y then x
  else y
#eval greater 3 5 -- 5
#eval greater 99 100 -- 100
#eval greater 4 4 -- 4

-- 関数を受け取る関数
def doTwice (f : Nat -> Nat) (x : Nat) : Nat :=
  f (f x)
#eval doTwice (fun x => x + 3) 7 -- 13
#eval doTwice double 7 -- 28
