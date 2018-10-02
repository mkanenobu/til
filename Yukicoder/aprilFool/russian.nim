import sequtils, strutils

var n,m,x:int
(n,m,x) = readLine(stdin).split.map(parseInt)

if m >= 2 or (n - m) >= 2:
    echo "YES"
else:
    echo "NO"
