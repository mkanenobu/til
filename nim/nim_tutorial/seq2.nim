import sequtils, strutils, algorithm, math

# 関数定義

### 関数定義
proc f1(s: string) =
  echo s

### 副作用なし
proc f2(s: string): string {.nosideeffect.} =
  # 最後に評価された値が戻り値になる
  if s.len > 5:
    # 文字列連結
    "Hello, " & s
  else:
    "(-_-)"

# 上のシンタックスシュガー
func f3(s: string): string =
  # echo s # echoは副作用を持つのでエラー
  s

echo f2("World!")
echo f2("World")

