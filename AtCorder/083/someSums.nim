import sequtils,strutils
let
    nab = readLine(stdin).split(" ").map(parseInt)
    lim = nab[0]
    a = nab[1]
    b = nab[2]
var p10000,p1000,p100,p10,p:int
proc sumSome():int =
    for i in 1..lim:
        p10000 = (i div 10000)
        p1000 = ((i mod 10000) div 1000)
        p100 = ((i mod 1000) div 100)
        p10 = ((i mod 100) div 10)
        p = (i mod 10)
        var pSum:int = p10000 + p1000 + p100 + p10 + p
        if pSum >= a and pSum <= b:
            result = result + i
    return result
echo sumSome()
