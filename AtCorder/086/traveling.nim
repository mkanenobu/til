import sequtils, strutils, math
var
    n:int = readLine(stdin).parseInt
    t:seq[int] = @[]
    x:seq[int] = @[]
    y:seq[int] = @[]
    txy:seq[int] = @[]
    xLoc,yLoc = 0
    i:int
while n != 0:
    txy = readLine(stdin).split.map(parseInt)
    t.add(txy[0])
    x.add(txy[1])
    y.add(txy[2])
    n -= 1
proc mov() =
   if x[i] > xLoc:
       xLoc += 1
   elif x[i] < xLoc:
       xLoc -= 1
   elif y[i] > yLoc:
       yLoc += 1
   elif y[i] < yLoc:
       yLoc -= 1
proc main():string =
    for i in 0..(sum(t)):
        if i == 0:
            for turn in 0..<t[i]:
                mov()
                if x[i] == xLoc and y[i] == yLoc:
                    if (turn == (t[i]-1) or turn mod 2 == 0):
                        return "Yes"
                    else:
                        return "No"
            return "No"
        elif i != 0:
            for turn in 0..<(t[i]-t[i-1]):
                mov()
                if x[i] == xLoc and y[i] == yLoc:
                    if turn == (t[i]-1) or turn mod 2 == 0:
                        return "Yes"
                    else:
                        return "No"
            return "No"

echo main()
