import strutils, sequtils

var n, p:int
(n, p) = readLine(stdin).split.map(parseInt)

if p == 0 or n == 1:
    echo "="
else:
    echo "!="
