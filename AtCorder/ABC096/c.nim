import  sequtils, strutils, algorithm, math

var
  h, w:int
  s:seq[string]
(h, w) = readLine(stdin).split.map(parseInt)
for i in 0..<h:
  s.add(readLine(stdin))


