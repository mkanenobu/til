import sequtils, strutils

var
    s:string = readLine(stdin)
    n = 1

for i in s:
    if i == 'L':
        n *= 2
    elif i == 'R':
        n = n * 2 + 1

echo n
