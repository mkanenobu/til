import sequtils, strutils, algorithm, math

var
  n, k:int
(n, k) = readLine(stdin).split.map(parseInt)

if n mod k == 0:
  echo 0
else:
  echo 1
