import sequtils, strutils, math

var
    a = readLine(stdin).split.map(parseInt)
    b = readLine(stdin).split.map(parseInt)
    c,d:int
(c, d) = readLine(stdin).split.map(parseInt)

if c > a[1]:
    a[0] -= (c - a[1])
    b[0] += c - a[1]
    b[1] = c

echo a[0] + min(d, b[0])
