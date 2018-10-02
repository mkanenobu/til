import sequtils, strutils, math

var
    n = readLine(stdin).parseInt
    a = readLine(stdin).split.map(parseInt)
    v = readLine(stdin).parseInt

echo sum(a) - v
