import sequtils, strutils

var d,p:int
(d, p) = readLine(stdin).split.map(parseInt)

echo int(d * (100 + p) / 100)
