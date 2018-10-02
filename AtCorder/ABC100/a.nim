import strutils, sequtils
var a,b:int
(a,b) = readLine(stdin).split.map(parseInt)
if max(a, b) <= 8:
  echo "Yay!"
else:
  echo ":("
