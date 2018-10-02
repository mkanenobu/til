import sequtils, strutils

var b = readLine(stdin).split.map(parseInt)

for i in 1..10:
    if not(b.contains(i)):
        echo i
