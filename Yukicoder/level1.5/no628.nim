import sequtils, strutils, algorithm, math

var
  n = readLine(stdin).parseInt
  no:seq[int] = @[]
  ms:seq[seq[int]]
  tags:seq[seq[string]] = @[]

for i in 0..<n:
  no.add(readLine(stdin).parseInt)
  ms.add(readLine(stdin).split.map(parseInt))
  tags.add(readLine(stdin).split)
