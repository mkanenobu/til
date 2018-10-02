import strutils, sequtils
var
    #ab:seq[int] = readLine(stdin).split(" ").map(parseInt)
    ab:seq[int] = split(readLine(stdin)).map(parseInt)
    a:int = ab[0]
    b:int = ab[1]

if ((a + b) mod 2 == 0):
    echo((a + b) div 2)
else:
    echo(((a + b) div 2) + 1)
