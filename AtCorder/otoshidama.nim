import strutils,sequtils
var
    NY:seq[int] = readLine(stdin).split(" ").map(parseInt)
    N = NY[0]
    Y = NY[1]
    x,y,z:int
proc isPositive(a:int,b:int,c:int):bool =
    if a >= 0 and b >= 0 and c>= 0: return true
    else: return false

proc money():string =
    for i in 1..N:
        x = Y div (i * 10000)
        for r in 1..N:
            y = (Y - (i * 10000)) div (r * 5000)
            z = N - (x + y)
            if isPositive(x,y,z) and (10000 * x) + (5000 * y) + (1000 * z) == Y:
                return $x & " " & $y & " " & $z
    return "-1 -1 -1"
echo money()
