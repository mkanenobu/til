import sequtils, strutils

let
    prime = [2,3,5,7,11,13]
    comp = [4,6,8,9,10,12]
    k = readLine(stdin).parseInt
var
    allAns:seq[int] = @[]

for i in prime:
    for j in comp:
        allAns.add(i * j)

echo count(allAns, k) / 36
