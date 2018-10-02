import sequtils,strutils
let ab = readLine(stdin).split(" ").map(parseInt)
if (ab[0] * ab[1]) mod 2 == 0:
    echo "Even"
else:
    echo "Odd"
