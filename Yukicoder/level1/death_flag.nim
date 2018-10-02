import strutils, sequtils

let
    f = readLine(stdin).split.map(parseInt)
    d = f[0..2]

if f[3] == 1 or count(d, 1) <= 1:
    echo "SURVIVED"
else:
    echo "DEAD"
