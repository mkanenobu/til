from strutils import split, parseInt
from sequtils import map

var nums = readLine(stdin).split.map(parseInt) # 標準入力をスペースでスプリットして各要素をキャスト

proc sum(): int =
  for i, value in nums:
    result = result + value

echo sum()
