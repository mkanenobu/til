import strutils

let n = readLine(stdin).parseInt
for i in countdown(n, 1):
    echo repeat($n, i)
