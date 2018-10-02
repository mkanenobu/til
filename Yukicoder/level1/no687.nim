import sequtils, strutils, algorithm, math

var
  n = readLine(stdin).parseInt
  a1, a2: int

if n > 10:
  a1 = 10
  a2 = n - a1
else:
  a1 = 1
  a2 = n - a1

echo(a1, " ", a2)
