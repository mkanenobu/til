import  sequtils, strutils, algorithm, math

var
  n,x:int
  m:seq[int] = @[]
(n, x) = readLine(stdin).split.map(parseInt)
for i in 1..n:
  m.add(readLine(stdin).parseInt)

x -= sum(m)
echo n + (x div min(m))
