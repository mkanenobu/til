import  sequtils, strutils, algorithm, math

var n = readLine(stdin).parseInt

if n mod 3 == 0 or ($n).contains("3"):
  echo "YES"
else:
  echo "NO"
