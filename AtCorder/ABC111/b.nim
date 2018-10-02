import sequtils, strutils, algorithm, math

var
  n = readLine(stdin).parseInt

while ($n).count(($n)[0]) != 3:
  n += 1

echo n
