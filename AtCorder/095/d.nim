import  sequtils, strutils, algorithm, math

var
  n,c:int
  e:int64
  res:seq[int64] = @[]
(n, c) = readLine(stdin).split.map(parseInt)
var
  xv = newSeqWith(n, newSeq[int64](2))
for i in 0..<n:
  xv[i] = readLine(stdin).split.map(parseBiggestInt)

for i,v in xv:
  if i == 0:
    res.add(v[1] - v[0])
    continue
  e = v[1] - (v[0] - xv[i - 1][0])
  res.add(res[i - 1] + e)
res.add(0)

echo res
echo max(res)
