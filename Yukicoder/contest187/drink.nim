import sequtils, strutils, math

var
    n,k:int
    a:seq[int]
    list:seq[int] = @[]
(n, k) = readLine(stdin).split.map(parseInt)
a = readLine(stdin).split.map(parseInt)

for i in a:
    if i mod k == 0:
        list.add(i div k)
    else:
        list.add(i div k + 1)

if sum(list) mod 2 == 0:
    discard
