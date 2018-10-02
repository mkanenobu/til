import  sequtils, strutils, algorithm, math

var n = readLine(stdin).parseInt
if n mod 2 == 0:
  echo n
else:
  echo n * 2
