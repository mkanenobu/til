import sequtils, strutils

var a,b,x:int
(a,b,x) = readLine(stdin).split.map(parseInt)

if a <= x and a + b > x:
  echo "YES"
else:
  echo "NO"
