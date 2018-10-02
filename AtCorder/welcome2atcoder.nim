import strutils,sequtils
var
    a: int = (readLine(stdin)).parseInt
    bc: seq[int] = readLine(stdin).split(" ").map(parseInt)
    str = readLine(stdin)
echo a+bc[0]+bc[1]," ",str
