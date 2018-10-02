import sequtils, strutils, algorithm, math

var
  input = readLine(stdin).split.map(parseInt)
  n = input[0]
  i = input[1]

echo n - i + 1
