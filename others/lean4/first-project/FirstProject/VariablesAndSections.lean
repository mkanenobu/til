-- Variables and Sections 変数とセクション

-- 次の3つの関数の定義を考える
def compose (α β γ : Type) (g : β → γ) (f : α → β) (x : α) : γ :=
  g (f x)

def doTwice (α : Type) (h : α → α) (x : α) : α :=
  h (h x)

def doThrice (α : Type) (h : α → α) (x : α) : α :=
  h (h (h x))

#print compose
#print doTwice
#print doThrice

-- Lean では variable を使うことでこのような定義をよりコンパクトに出来る
-- variable (<変数名> : <変数の型名>) と書くと具体的な関数・定数定義と独立して変数名に型を付けることが出来る
variable (α β γ : Type)
def compose2 (g : β → γ) (f : α → β) (x : α) : γ :=
  g (f x)
def doTwice2 (h : α → α) (x : α) : α :=
  h (h x)
def doThrice2 (h : α → α) (x : α) : α :=
  h (h (h x))
#print compose2
#print doTwice2
#print doThrice2

-- Type に限らない任意の型を変数に与えることが出来る
variable (α β γ : Type)
variable (g : β → γ) (f : α → β) (h : α → α)
variable (x : α)

def compose3 := g (f x)
def doTwice3 := h (h x)
def doThrice3 := h (h (h x))
#print compose3
#print doTwice3
#print doThrice3

-- #print を使うと指定した定義に関する情報が表示される
-- それぞれの定義グループの関数が同じ関数を定義していることが確認出来る

-- variable は宣言された変数を参照する定義に該当の変数を入力引数として自動的に挿入する挙動をする
-- この場合、α、β、γ、g、f、h、x は指定した型を持つ固定された項であると考えて定義を書けば、後は Lean が自動的に定義を抽象化してくれる

-- 一度variableを使って変数を宣言するとその変数は宣言されたところから現在のファイルの最後まで有効
-- しかし変数のスコープを制限した方が使いやすいこともあるので Lean ではスコープを制限するための　section キーワードを提供している

section useful
  variable (a b c : Type)
  variable (g : b -> c) (f : a -> b) (h : a -> a)
  variable (x : a)

  -- セクション内で a は参照可能
  #check a

  def compose4 := g (f x)
  def doTwice4 := h (h x)
  def doThrice4 := h (h (h x))
end useful

-- セクション内で定義された関数はセクション外からでも参照可能
#check compose4
-- variable で定義された変数はセクション外からは参照不可能
-- #check a

-- セクション内の行をインデントする必要はなく、名前を付ける必要も無い
-- が名前を付けた場合は同じ名前を使ってセクションを閉じる必要がある
-- 以下は最小のセクションの例
section
end
