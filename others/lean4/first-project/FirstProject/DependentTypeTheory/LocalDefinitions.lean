-- Local Definitions ローカル定義

-- キーワード let を使うことでローカルな定義を行える
#check let y := 2 + 2; y * y -- Nat
#eval  let y := 2 + 2; y * y  -- 16

def doubleSquare (x : Nat) : Nat :=
  let y := x + x; y * y
#eval doubleSquare 3 -- 36
-- ; は式の切れ目で改行と同じ意味
-- 以下は上の式と同じ
def doubleSquare2 (x : Nat) : Nat :=
  let y := x + x
  y * y
