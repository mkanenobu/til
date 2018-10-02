import sequtils, strutils

var
    p1 = readLine(stdin).parseInt
    p2 = readLine(stdin).parseInt
    n = readLine(stdin).parseInt
    R:seq[int] = @[]
    lossNum = 0

for i in 0..<n:
    R.add(readLine(stdin).parseInt)

var dedupR = deduplicate(R)

for j in dedupR:
    if R.count(j) > 1:
        lossNum += (R.count(j) - 1)

echo lossNum * (p1 + p2)
