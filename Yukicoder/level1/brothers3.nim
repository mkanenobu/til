import strutils, algorithm
type height = tuple[p:char, h:int]
var
    a: height = ('A', readLine(stdin).parseInt)
    b: height = ('B', readLine(stdin).parseInt)
    c: height = ('C', readLine(stdin).parseInt)
    bros = @[a,b,c]

bros = bros.sortedByIt(it.h)
for i in reversed(bros):
    echo i.p
