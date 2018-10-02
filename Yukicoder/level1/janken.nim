import sequtils, strutils

var n, k: int
(n, k) = readLine(stdin).split.map(parseInt)

if n == k:
    echo "Drew"
elif (k - n).in([1, -2]):
    echo "Won"
else:
    echo "Lost"
