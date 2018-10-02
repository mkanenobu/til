import sequtils, strutils, times

var n,h,m,t:string
(n, h, m, t) = readLine(stdin).split

if len(m) == 1:
    m = "0" & m
var
    f:DateTime = parse(h & ":" & m, "h:mm")
    sleep = ((n.parseInt - 1) * t.parseInt)
    wakeTime:DateTime = f + sleep.minutes

echo format(wakeTime, "H")
echo format(wakeTime, "m")
