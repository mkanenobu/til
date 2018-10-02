import sequtils, strutils, algorithm, math

var
  ab = readLine(stdin).split.map(parseInt)
  a = ab[0]
  b = ab[1]

echo ((a * b) - (a + b - 1))
