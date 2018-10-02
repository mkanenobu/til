import sequtils, strutils, math

var
    n,a:int
(n, a) = readLine(stdin).split.map(parseInt)
var x = readLine(stdin).split.map(parseInt)

if sum(x) / n == toFloat(a):
    echo "YES"
else:
    echo "NO"
