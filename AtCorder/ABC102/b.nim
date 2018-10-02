import  sequtils, strutils, algorithm, math

var
  n = readLine(stdin).parseInt
  a:seq[int] = readLine(stdin).split.map(parseInt)

echo max(a) - min(a)
