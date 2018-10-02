import sequtils, strutils, math

var p,q:float
(p, q) = readLine(stdin).split.map(parseFloat)


var
    secondSucces = (1.0 - p) * q
    thirdSucces = p * q * (1.0 - q)

if thirdSucces > secondSucces:
    echo "YES"
else:
    echo "NO"
