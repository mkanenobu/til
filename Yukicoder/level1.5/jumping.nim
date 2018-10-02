import sequtils, strutils, math, algorithm

var
    n = readLine(stdin).parseInt
    x:seq[int] = readLine(stdin).split.map(parseInt)

sort(x, cmp[int])

for i in 1..<n:
    if (x[i] mod 2 == 0 and x[i - 1] mod 2 == 1) or (x[i] mod 2 == 1 and x[i - 1] mod 2 == 0):
        n -= 2
        continue

