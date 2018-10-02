import sequtils, strutils, math

var x,y,r,dist:float
(x,y,r) = readLine(stdin).split.map(parseFloat)

dist = abs(x) + abs(y)
var p = dist + (sin(degToRad(45.0)) * r) * 2
echo int(ceil(p))
