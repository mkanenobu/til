import sequtils, strutils, algorithm, math

var input = readLine(stdin).split.map(parseInt)
sort(input, cmp[int])
echo 10 * input[2] + input[0] + input[1]
