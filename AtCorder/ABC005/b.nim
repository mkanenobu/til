import  sequtils, strutils, algorithm, math

var
  n:int = readLine(stdin).parseInt
  t:seq[int] = @[]

for i in 0..<n:
  t.add(readLine(stdin).parseInt)

echo min(t)
