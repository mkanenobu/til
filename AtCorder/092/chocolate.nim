import sequtils, strutils, math

var
    n = readLine(stdin).parseInt
    a:seq[int] = @[]
    d,x,res:int
(d, x) = readLine(stdin).split.map(parseInt)

for i in 0..<n:
    a.add(readLine(stdin).parseInt)

for k in a:
    for day in 0..<d:
        if day mod k == 0:
            res += 1

echo res + x
