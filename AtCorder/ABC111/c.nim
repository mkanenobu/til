import sequtils, strutils, algorithm, math
import sets

var
  n = readLine(stdin).parseInt
  v = readLine(stdin).split.map(parseInt)
  oddNum:seq[int] = @[]
  oddNumCount:seq[int] = @[]
  evenNum:seq[int] = @[]
  evenNumCount:seq[int] = @[]
  cnt:int

proc main():int =
  if (v.deduplicate).len == 1:
    return n div 2
  for i in 0..<n:
    if i mod 2 == 1:
      evenNum.add(v[i])
    else:
      oddNum.add(v[i])

  for i in oddNum:
    for j in oddNum:
      if i == j: cnt += 1
    oddNumCount.add(oddNum.count(i))
  for i in evenNum:
    evenNumCount.add(evenNum.count(i))
  return (n div 2) - max(oddNumCount) + (n div 2) - max(evenNumCount)

echo main()
