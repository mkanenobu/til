import sequtils, strutils, algorithm, math

var
  n, k:int
  a:seq[int] = @[]
(n, k) = readLine(stdin).split.map(parseInt)
for i in 0..<n:
  a.add(readLine(stdin).parseInt)
a.sort(system.cmp[int])

a = a.filter(proc(n:int):bool = n < k)
