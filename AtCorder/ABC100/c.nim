import sequtils, strutils, math
var
  n = readLine(stdin).parseInt
  a:seq[float] = readLine(stdin).split.map(parseFloat)
  res:int = 0

while true:
  a = a.filter do (x:float) -> bool: (x / 2) mod 1 == 0.0
  if a.len != n:
    break

