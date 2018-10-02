import sequtils, strutils
var a,c:int
(a,c) = readLine(stdin).split.map(parseInt)

echo a xor c
