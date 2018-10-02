import sequtils, strutils, math, algorithm

var
    n,m:int
    a:seq[int]
    cards:seq[int] = @[]
(n, m) = readLine(stdin).split.map(parseInt)
a = readLine(stdin).split.map(parseInt)

for i in 0..<n:
    cards.add(i)

for i in a:
    var item = cards[i - 1]
    cards.delete(i - 1)
    cards.insert(item, 0)

echo cards[0] + 1
