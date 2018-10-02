import sequtils, strutils, math

var
    c = readLine(stdin).parseFloat
    rIn,rOut,v,r:float
(rIn,rOut) = readLine(stdin).split.map(parseFloat)
r = (rOut - rIn) / 2
v = 2 * pow(PI, 2) * pow(r, 2) * (rIn + r)

echo v * c
