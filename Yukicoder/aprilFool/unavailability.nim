import sequtils, strutils, math

var
    n = readLine(stdin).parseInt
    a:seq[int] = @[]
for i in 0..(n - 1):
    a.add(readLine(stdin).split.map(parseInt))

for i in 0..(n - 1):
    var
        a1 = a[i * 2]
        a2 = a[(i * 2) + 1]
    if a1 == a2:
        echo char(61)
    elif max(a1, a2) == a1:
        echo char(62)
    elif max(a1, a2) == a2:
        echo char(60)
