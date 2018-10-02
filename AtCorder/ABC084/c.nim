import sequtils, strutils, algorithm, math

var
  n = readLine(stdin).parseInt
  arr:seq[int] = @[]

for i in 0..<n:
  arr = readLine(stdin).split.map(parseInt)


