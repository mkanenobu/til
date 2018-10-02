import sequtils, strutils

var
    n = readLine(stdin).parseInt
    m = readLine(stdin).parseInt
    pq:seq[seq[int]] = @[]

for i in 0..<m:
    pq.add(readLine(stdin).split.map(parseInt))

for j in pq:
    if n == j[0]:
        n = j[1]
    elif n == j[1]:
        n = j[0]

echo n
