import strutils, sequtils, algorithm, math
import parseutils

var
  aIn = readLine(stdin).split
  bIn = readLine(stdin).split
  a:tuple[name:string, point:BiggestFloat]
  b:tuple[name:string, point:BiggestFloat]

proc pBiggestFloat(s:string):float64 =
  var x:float64
  discard parseBiggestFloat(s, x)
  return x

a =  (aIn[0], aIn[1].pBiggestFloat)
b =  (bIn[0], bIn[1].pBiggestFloat)

if a.point == b.point:
  if 
  echo -1
elif max(a.point, b.point) == a.point:
  echo a.name
else:
  echo b.name
