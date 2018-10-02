import sequtils, strutils, algorithm, math

var
  n = readLine(stdin).split.map(parseFloat)

if n[0] == n[1]:
  echo sqrt(n[0] ^ 2 * 2)
else:
  echo sqrt(n.max ^ 2 - n.min ^ 2)
