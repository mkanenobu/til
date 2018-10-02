import sequtils, strutils
var
    k,n,f:int
    a:seq[int]

(k, n, f) = readLine(stdin).split.map(parseInt)
a = readLine(stdin).split.map(parseInt)

var total = k * n

for i in 0..<f:
    total -= a[i]

if total < 0:
    echo -1
else:
    echo total
