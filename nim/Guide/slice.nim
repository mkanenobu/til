import sequtils, strutils, algorithm, math

var
  a = @[1,2,3,4,5]

# 普通のスライス
echo a[0..3]

# 後ろからのインデックス
echo a[^1]

# これはエラーなので
# echo a[^1..2]
echo a[2..^1].reversed
