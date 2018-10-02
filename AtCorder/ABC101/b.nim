import  sequtils, strutils, algorithm, math
var
  n = readLine(stdin)
  s:int

for i in n:
  s += ($i).parseInt

if n.parseInt mod s == 0:
  echo "Yes"
else:
  echo "No"
