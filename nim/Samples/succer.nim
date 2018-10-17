import sequtils, strutils, algorithm, math

let
  x = readLine(stdin).parseInt
  ans = x div 3

if x mod 3 == 0:
  echo ans
else:
  echo ans + x mod 3
