import sequtils, strutils

let
    a = readLine(stdin).parseInt
    bc = readLine(stdin).split(" ").map(parseInt)
    s = readLine(stdin)

echo a + bc[0] + bc[1], " ", s
