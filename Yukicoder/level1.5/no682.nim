import sequtils, strutils, algorithm, math

var
  a, b:int
  res:int

(a, b) = readLine(stdin).split.map(parseInt)

for i in a..b:
  if ((a + b + i) / 3) mod 1 == 0:
    res += 1

echo res
