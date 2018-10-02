import sequtils, strutils, math
var d, n:int
(d, n) = readLine(stdin).split.map(parseInt)

echo (100 ^ d) * n
