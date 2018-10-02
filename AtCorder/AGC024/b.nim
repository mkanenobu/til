import  sequtils, strutils, algorithm, math

var
  n = readLine(stdin).parseInt
  p:seq[int] = @[]
for i in 1..n:
  p.add(readLine(stdin).parseInt)


