import sequtils, strutils, algorithm, math

var
  a,b,c:int
(a,b,c) = readLine(stdin).split.map(parseInt)
a *= 60
c *= 3600

proc main():int =
  if a <= b:
    return -1
  else:
    return int(ceil(c / (a - b)))

echo main()
