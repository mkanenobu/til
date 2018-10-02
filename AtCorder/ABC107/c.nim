import sequtils, strutils, algorithm, math

var
  n, k:int
  x:seq[int] = @[]
  x_plus:seq[int]
  x_minus:seq[int]
  dist:seq[int] = @[]

(n, k) = readLine(stdin).split.map(parseInt)
x = readLine(stdin).split.map(parseInt)

x_plus = filter(x, proc(n:int): bool = n < 0)
x_minus = filter(x, proc(n:int): bool = n > 0)
sort(x_minus, system.cmp[int])
