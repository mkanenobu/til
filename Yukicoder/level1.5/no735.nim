import sequtils, strutils, algorithm, math

var r,d: float
(r, d) = readLine(stdin).split.map(parseFloat)

echo sqrt(d ^ 2 - r ^ 2)
