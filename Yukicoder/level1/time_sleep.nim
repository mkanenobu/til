import sequtils, strutils, times

var
    n = readLine(stdin).parseInt
    t = newSeqWith(n, newSeq[string](2))
    ans = 0

for i in 0..<n:
    t[i][0..1] = readLine(stdin).split

for i in t:
    var
        t1:seq[int] = i[0].split(":").map(parseInt)
        t2:seq[int] = i[1].split(":").map(parseInt)
    if t1[0] > t2[0] or (t1[0] == t2[0] and t1[1] > t2[1]):
        ans += (24 * 60) - (t1[0] * 60 + t1[1]) + (t2[0] * 60 + t2[1])
    else:
        ans += (t2[0] * 60 + t2[1]) - (t1[0] * 60 + t1[1])

echo ans
