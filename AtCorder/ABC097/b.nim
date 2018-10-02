import sequtils, strutils, algorithm, math

var
  x = readLine(stdin).parseInt
  res:seq[int] = @[]
  n: int

for i in 1..100:
  for j in 2..10:
    n = i ^ j
    if n > x: break
    res.add(n)

res = filter(res) do (a:int) -> bool : a <= x
echo max(res)
