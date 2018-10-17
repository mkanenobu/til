import sequtils, strutils, algorithm, math

var
  a,b,c: int
(a,b,c) = readLine(stdin).split.map(parseInt)

echo max(a*b*c, a+b+c, a*b+c, a+b*c)
