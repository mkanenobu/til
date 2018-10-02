import sequtils, strutils

var
    n,a,b:int
    t:seq[int] = @[]
    res = 0
(n,a,b) = readLine(stdin).split.map(parseInt)

for i in 1..n:
    var sum:int = 0
    for j in $i:
        sum += parseInt($j)
    if sum >= a and sum <= b:
        t.add(i)

for i in t:
    res += i

echo res
