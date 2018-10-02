import sequtils,strutils,algorithm
var
    n:int = readLine(stdin).parseInt
    a:seq[int] = readLine(stdin).split(" ").map(parseInt)
    p1,p2:int
sort(a,system.cmp[int])
for i,v in a:
    if i mod 2 == 0:
        p1 += v
    else:
        p2 += v
echo abs(p1 - p2)
