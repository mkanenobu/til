import strutils
var
    x = readLine(stdin).parseInt
    a = readLine(stdin).parseInt
    b = readLine(stdin).parseInt
echo((x - a) mod b)
