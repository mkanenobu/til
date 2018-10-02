import strutils, sequtils, algorithm, math

var
  n = readLine(stdin).parseInt
  space = newSeq[int](n)
  tab = newSeq[int](n)
  width = newSeq[int](n)

for i in 0..<n:
  (space[i], tab[i]) = (readLine(stdin).split.map(parseInt))

for i in 0..<n:
  width[i] = space[i] + (tab[i] * 4)

proc main():int =
  if not space.filter(proc(x:int):bool = x mod 2 == 0).len.in([n,0]):
    return -1
  else:
    return abs(sum(width.map(proc(x:int):int = x - max(width)))) div 2

echo main()
