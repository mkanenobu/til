import sequtils, strutils, math

var
    n = readLine(stdin).parseInt
    a:seq[int] = @[0]
    total:int
a.add(readLine(stdin).split.map(parseInt))
a.add(0)

for i in 1..<len(a):
    total += abs(a[i] - a[i - 1])
total += abs(0 - a[^1])

for j in 1..<(len(a) - 1):
    if (a[j] >= a[j - 1] and a[j] <= a[j + 1]) or (a[j] <= a[j - 1] and a[j] >= a[j + 1]):
        echo total
    else:
        echo total - abs(a[j - 1] - a[j]) - abs(a[j] - a[j + 1]) + abs(a[j - 1] - a[j + 1])

