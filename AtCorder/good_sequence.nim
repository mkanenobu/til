import sequtils, strutils, algorithm
var
    n:int = readLine(stdin).parseInt
    a:seq[int] = readLine(stdin).split(" ").map(parseInt)
for i in 0..<n:
    for i2 in 0..<len(a):
        if a[i] == a[i2]:

    #if a[i] == a[nth]:
    #    echo ""
    #else:
    #    nth = nth + 1

