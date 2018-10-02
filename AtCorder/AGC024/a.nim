import sequtils, strutils, math

var a,b,c,k: int64
(a,b,c,k) = readLine(stdin).split.map(parseBiggestInt)

if k mod 2 == 0:
  echo a - b
else:
  echo b - a
