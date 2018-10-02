import strutils, sequtils
var
    p = newSeq[int](2)
    q = newSeq[int](2)
p = readLine(stdin).split.map(parseInt)
q = readLine(stdin).split.map(parseInt)

echo (abs(p[0] - q[0]) + abs(p[1] - q[1])) / 2
