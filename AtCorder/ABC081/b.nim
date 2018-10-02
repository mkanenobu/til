import sequtils, strutils, algorithm, math

var
  n = readLine(stdin).parseInt
  a:seq[int] = readLine(stdin).split.map(parseInt)
  res:int = 0

proc main():int =
  while true:
    if len(a.filter(proc(x:int):bool = x mod 2 == 0)) != n:
      return res
    a = a.map(proc(x:int):int = x div 2)
    res += 1

echo main()
