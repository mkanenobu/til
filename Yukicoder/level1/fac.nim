import sequtils, strutils

var
    n = readLine(stdin).parseInt
    a = readLine(stdin).split.map(parseInt)
    b = readLine(stdin).split.map(parseInt)
    points = newSeq[int](101)

for i,v in b:
    points[v] += a[i]

if max(points) == points[0]:
    echo "YES"
else:
    echo "NO"
