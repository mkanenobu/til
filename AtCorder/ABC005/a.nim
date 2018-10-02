import  sequtils, strutils, algorithm, math

var x, y:int
(x, y) = readLine(stdin).split.map(parseInt)
echo y div x
