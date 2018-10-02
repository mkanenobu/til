import sequtils,strutils
var n,a,b:int
(n,a,b) = readLine(stdin).split(" ").map(parseInt)
echo min(n * a,b)
