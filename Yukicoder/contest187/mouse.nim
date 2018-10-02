import sequtils, strutils

var
    input = readLine(stdin)
    x:int
    o:int

for i in input:
    if i == 'x':
        x += 1
    elif i == 'o':
        o += 1

for i in input:
    if i == 'x':
        echo 100 / ((x + o) / o)
        x -= 1
    elif i == 'o':
        echo 100 / ((x + o) / o)
        o -= 1

