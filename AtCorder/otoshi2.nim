import strutils,sequtils
var
    NY:seq[int] = readLine(stdin).split(" ").map(parseInt)
    N = NY[0]
    Y = NY[1]
proc isPositive(a:int,b:int,c:int):bool =
    if a >= 0 and b >= 0 and c>= 0: return true
    else: return false
proc money():string =
    for x in 0..N:
        for y in 0..(N - x):
            var z = N - (x + y)
            if isPositive(x,y,z) and (10000 * x) + (5000 * y) + (1000 * z) == Y:
                return $x & " " & $y & " " & $z
    return "-1 -1 -1"
echo money()
