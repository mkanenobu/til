import sequtils, strutils
var a,b,c:int
(a,b,c) = readLine(stdin).split(" ").map(parseInt)
if c <= a + b:
    echo "Yes"
else:
    echo "No"
