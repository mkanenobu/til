import sequtils, strutils, algorithm, math

var
  n, k:float
(n, k) = readLine(stdin).split.map(parseFloat)
echo int(50 * n) + int((50 * n) / round(0.8 + (0.2 * k), 3))
