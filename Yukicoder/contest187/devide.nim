import strutils, sequtils

var
    a = readLine(stdin).split.map(parseInt)
    ab = a[0] * a[1]

echo ab mod 1000000007
