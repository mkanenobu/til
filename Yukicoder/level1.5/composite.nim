import strutils, sequtils, algorithm, math

var n = readLine(stdin).parseInt

block:
  if n mod 2 == 0:
    echo n
    break
  else:
    for i in (n - 100) .. (n + 100):
      if (i > 0 and i mod 2 == 0) and not (i == 2):
        echo i
        break
