import sequtils,strutils
var a,b:int
echo "Please input number"
(a,b) = readLine(stdin).split.map(parseInt)
echo a
echo b

