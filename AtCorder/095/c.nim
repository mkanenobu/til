import  sequtils, strutils, algorithm, math

var a,b,c,x,y:int
(a,b,c,x,y) = readLine(stdin).split.map(parseInt)
if x > y:
  echo min([(a * x + b * y), (max(x, y) * 2 * c), (((min(x, y) * 2) * c) + (x - y) * a)])
else:
  echo min([(a * x + b * y), (max(x, y) * 2 * c), (((min(x, y) * 2) * c) + (y - x) * b)])
