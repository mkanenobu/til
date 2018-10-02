import sequtils, strutils, algorithm

var
    n = readLine(stdin).parseInt
    a = readLine(stdin).split.map(parseInt)

sort(a, cmp[int])
if n mod 2 == 1:
    echo a[n div 2]
else:
    echo (a[n div 2] + a[(n div 2) - 1]) / 2
