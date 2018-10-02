import  sequtils, strutils, algorithm, math
var
  n, k:int
(n, k) = readLine(stdin).split.map(parseInt)

echo int(ceil((n - 1) / (k - 1)))
