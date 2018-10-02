import sequtils, strutils, algorithm, math

var
  x,y,n:int
  a:seq[int] = @[]

(x, y) = readLine(stdin).split.map(parseInt)
n = readLine(stdin).parseInt
a = readLine(stdin).split.map(parseInt)


