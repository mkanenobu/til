import sequtils, strutils, math

var
    n = readLine(stdin).parseInt
    c = readLine(stdin).split.map(parseInt)
    bas = c.sum div 10

echo 30 * len(c.filter(proc(x:int):bool = x <= bas))
