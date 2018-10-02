import strutils, sequtils

var n = readLine(stdin).split.map(parseInt)

proc main():int =
    for i in n:
        if i mod 15 == 0:
            result += 8
        elif i mod 3 == 0 or i mod 5 == 0:
            result += 4
        else:
            result += len($i)

echo main()
