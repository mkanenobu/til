import sequtils, strutils
var a,b:int
(a, b) = readLine(stdin).split.map(parseInt)
var
    res = b div a

if abs(a) > abs(b):
    echo "NO"
elif res * a != b:
    echo "NO"
else:
    echo res
