import sequtils, strutils, algorithm, math

var
  n = readLine(stdin).split.map(parseInt)[0]
  res:int

for i in 0..<n:
  res += count(readLine(stdin), 'W')

echo res
