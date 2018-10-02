import sequtils, strutils, algorithm, math

var
  line1 = readLine(stdin).split.map(parseInt)
  x_arr = readLine(stdin).split.map(parseInt)
  y_arr = readLine(stdin).split.map(parseInt)
x_arr.add(line1[2])
y_arr.add(line1[3])

if x_arr.max < y_arr.min:
  echo "No War"
else:
  echo "War"
