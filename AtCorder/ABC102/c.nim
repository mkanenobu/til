import sequtils, strutils, algorithm, math

var
  n = readLine(stdin).parseInt
  a:seq[int] = readLine(stdin).split.map(parseInt)
  b:seq[int] = @[]
  bRes:int
  res:seq[int] = @[0, 0]

for i in 1..n:
  b.add(a[i - 1] - i)
b = sorted(b, cmp[int])

if n mod 2 == 1:
  bRes = b[n div 2]
  for i in 1..n:
    res[0] += abs(a[i - 1] - (bRes + i))
  echo res[0]
else:
  bRes = b[n div 2]
  for i in 1..n:
    res[0] += abs(a[i - 1] - (bRes + i))

  bRes = b[n div 2 - 1]
  for i in 1..n:
    res[1] += abs(a[i - 1] - (bRes + i))

  echo min(res)
