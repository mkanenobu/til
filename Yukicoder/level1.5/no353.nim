import sequtils, strutils, algorithm, math

var
  a,b:int
(a, b) = readLine(stdin).split.map(parseInt)
echo sum([a, b])
