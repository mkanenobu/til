import strutils, sequtils

var l,k:int
(l, k) = readLine(stdin).split.map(parseInt)

if l mod (k * 2) == 0:
    echo (l div (k * 2) - 1) * k
else:
    echo (l div (k * 2)) * k
