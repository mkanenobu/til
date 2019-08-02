import sequtils, strutils, algorithm, math

# 関数定義

### 関数定義
proc f1(s: string) =
  echo s

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


proc addOne(n: int): int =
  n + 1

# 関数呼び出し
var int_var: int
# 関数、変数は snake_case, camelCaseを区別しない
int_var = addOne(10)
intVar  = add_one(10)
int_var = add_one(10)
intVar  = addOne(10)


# Rubyと同様の括弧の省略や
# D言語由来のUFCSという、関数をメソッド風に呼べる構文をサポートしている
### 以下全て同じ
echo(int_var)
echo int_var
int_var.echo
