import sequtils, strutils
var
    n = readLine(stdin).parseInt
    m = readLine(stdin).parseInt

echo 1000 * (n div (1000 * m))
