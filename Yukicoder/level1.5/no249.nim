import sequtils, strutils, algorithm, math

var
  n:seq[int] = @[]
  k:seq[int] = @[]
  input:seq[int]

for i in 1..1000:
  input = readLine(stdin).split.map(parseInt)
  n.add(input[0])
  k.add(input[1])
