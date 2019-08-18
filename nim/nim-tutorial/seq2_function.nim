import sequtils, strutils, algorithm, math

# 関数定義

### 関数定義
proc f1() =
  echo "Hello, World!"

### 副作用がないことをプラグマで宣言
proc f2(s: string): string {.nosideeffect.} =
  # 最後に評価された値が戻り値になる
  if s.len > 5:
    # 文字列連結演算子
    "Hello, " & s
  else:
    "(-_-)"

# 上のシンタックスシュガー(副作用があるとエラー)
func f3(s: string): string =
  # echo s # echoは副作用を持つのでエラー
  s

# プロシージャで戻り値として解釈出来るものが存在しない場合、
# あらかじめ用意されているresult変数が戻り値になる
proc f4(n: int): int =
  result + n

# 無名関数を変数に代入(関数もトップレベルオブジェクト)
const f5 = proc(s: string): string = s

proc addOne(n: int): int =
  n + 1

proc echoBack(x: string or int) =
  echo x

# 引数、戻り値の型も型推論に任せる
proc f6(x: auto): auto = x

# ジェネリクス
proc f7[T](a: T, b: int): auto =
  when T is int:
    result = 123 + b
  when T is string:
    result = "string" & $b

# template: マクロっぽいもの
template mapIt2[T](s: openarray[T], op: untyped): untyped =
  var result: seq[T] = @[]
  for it {.inject.} in items(s):
    result.add(op)
  result

# 関数呼び出し
var int_var: int
# 関数、変数は snake_case, camelCaseを区別しない
int_var = addOne(10)
intVar  = add_one(10)
int_var = add_one(10)
intVar  = addOne(10)


# Rubyと同様の括弧の省略や
# D言語由来のUFCSを導入しているしている
### 以下全て同じ
echo(int_var)
echo int_var
int_var.echo
e_c_h_o intVar
int_var.eCho

echo f4(10)
