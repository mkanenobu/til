import sequtils, strutils

var
    n = readLine(stdin).parseInt
    a = newSeqWith(n, newSeq[string](n))
    posRen:seq[int] = @[]

for i in 0..<n:
    a[i] = (readLine(stdin).split)

for j in 0..<n:
    for k in 0..<n:
        if not a[k][j].in(["nyanpass", "-"]):
            break
        if k == (n - 1):
            posRen.add(j)

if posRen.len != 1:
    echo -1
else:
    echo posRen[0] + 1
