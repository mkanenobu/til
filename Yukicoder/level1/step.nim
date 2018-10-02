import sequtils, strutils, math

var a,b:int
(a, b) = readLine(stdin).split.map(parseInt)

echo int(ceil(b / a))
