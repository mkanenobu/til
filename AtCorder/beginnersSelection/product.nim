import sequtils, strutils

let input = readLine(stdin).split.map(parseInt)
if input[0] mod 2 == 1 and input[1] mod 2 == 1:
    echo "Odd"
else:
    echo "Even"
