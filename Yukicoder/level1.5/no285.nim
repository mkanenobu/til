import sequtils, strutils, algorithm, math

var
  d = readLine(stdin).parseFloat

echo round(d * 1.08, 2)
