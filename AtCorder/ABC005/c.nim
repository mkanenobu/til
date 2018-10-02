import  sequtils, strutils, algorithm, math

var
  t = readLine(stdin).parseInt
  n = readLine(stdin).parseInt
  a:seq[int] = readLine(stdin).split.map(parseInt)
  m = readLine(stdin).parseInt
  b:seq[int] = readLine(stdin).split.map(parseInt)
  eaten:seq[int] = @[]

a = a.filter(proc(num:int): bool = abs(num - b[0]) >= t)
echo a

proc main():string =
  if a.len < m:
    return "no"
  else:
    discard

echo main()
