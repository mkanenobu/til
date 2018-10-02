import sequtils,strutils
var
    xy = readLine(stdin).split(" ").map(parseInt)
    x = xy[0]
    y = xy[1]
proc gift():int =
    for i in 1..y:
        x = (x * 2)
        result = result + 1
        if x > y:
            return
echo gift()
