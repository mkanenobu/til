import sequtils, strutils, math, algorithm, parseutils
# WA

var
    n = readLine(stdin).parseInt
    c = newSeq[string](n)
    d = newSeq[string](n)
    bf1, bf2:float64
    res:float64
for i in 0..<n:
    (c[i],d[i]) =  readLine(stdin).split

for i in 0..<n:
    discard c[i].parseBiggestFloat(bf1)
    discard c[i].parseBiggestFloat(bf2)
    var canSit = ceil(float64(bf1) / float64(2))
    res += canSit * bf2

echo res mod (10e9 + 7)
