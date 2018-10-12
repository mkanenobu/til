import sequtils, strutils

var
  n = readLine(stdin).parseInt
  a = newSeqWith(n, newSeq[string](n))
  posRen:seq[int] = @[]

for i in 0..<n:
  a[i] = (readLine(stdin).split)

for j in 0..<n:
  block loop:
    for k in a[j][0..<n]:
      if not(k == "nyanpass" or k == "-"):
        break loop
    posRen.add(j)
if posRen.len == 0 or posRen.len >= 2:
  echo -1
else:
  echo posRen[0]
