import  sequtils, strutils, algorithm, math

var a,b,c,d: int
(a,b,c,d) = readLine(stdin).split.map(parseInt)

if abs(a - c) <= d or (abs(a - b) <= d and abs(b - c) <= d):
  echo "Yes"
else:
  echo "No"
