import strutils, sequtils, algorithm, math

var
  n,m,x:int
  a:seq[int]
  toZero, toN:int
(n,m,x) = readLine(stdin).split.map(parseInt)
a = readLine(stdin).split.map(parseInt)

for i in countup(x, n):
  if a.contains(i):
    toN += 1

for i in countdown(x, 0):
  if a.contains(i):
    toZero += 1

echo min(toZero, toN)
