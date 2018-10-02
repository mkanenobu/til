import sequtils, strutils

var a,b:int
(a, b) = readLine(stdin).split.map(parseInt)

for i in a..b:
    if i mod 3 == 0 or contains($i, "3"):
        echo i
