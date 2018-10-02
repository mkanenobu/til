import strutils, sequtils, algorithm, math

var
  n = readLine(stdin).parseInt
  a:seq[int] = readLine(stdin).split().map(parseInt)
  x2:seq[int] = a
  res1, res2:int
sort(x2, cmp[int])
res1 = x2[(n div 2)]
res2 = x2[((n - 2) div 2)]

if res1 == res2:
  for i in 0..<n:
    echo res1
else:
  for i in 0..<n:
    if a[i] <= res2:
      echo res1
    elif a[i] >= res1:
      echo res2
