import sequtils, strutils, math

var x,y,res:float
(x, y) = readLine(stdin).split.map(parseFloat)

res = sqrt(pow(x, 2) + pow(y, 2)) * 2
echo int(res + 1)
