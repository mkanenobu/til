import strutils, sequtils, algorithm, math

var
  n = readLine(stdin).parseInt
  aOrg = readLine(stdin).split.map(parseFloat)
  a = aOrg
  resN:float
  resR:float

resN = max(a)
sort(a, cmp[float])
a.delete(n - 1)
a.apply(proc(x:float):float = abs((x - resN / 2)))
resR = min(a) + resN / 2
if not aOrg.contains(resR):
  resR = resN - resR
if resR == resN:
  resR = 0

echo int(resN), " ", int(resR)
