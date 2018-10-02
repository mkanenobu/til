import sequtils, strutils

var
    k = readLine(stdin).parseInt
    s = readLine(stdin).parseInt

echo int(100 * (s / (100 - k)))
