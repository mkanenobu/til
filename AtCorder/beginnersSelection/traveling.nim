import sequtils, strutils

var
    n = readLine(stdin).parseInt
    t = newSeq[int](n)
    x = newSeq[int](n)
    y = newSeq[int](n)
    xLoc = 0
    yLoc = 0
    time:int

for i in 0..<n:
    (t[i], x[i], y[i]) = readLine(stdin).split.map(parseInt)

proc main():string =
    for i,v in t:
        if i == 0:
            time = v
        else:
            time = v - t[i - 1]
        var dist = abs(xLoc - x[i]) + abs(yLoc - y[i])

        if time < dist:
            return "No"
        elif (time - dist) mod 2 != 0:
            return "No"
        else:
            xLoc = x[i]
            yLoc = y[i]
    return "Yes"

echo main()
