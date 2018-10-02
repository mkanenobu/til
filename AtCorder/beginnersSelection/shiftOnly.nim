import sequtils, strutils

var
    n = readLine(stdin).parseInt
    a = readLine(stdin).split.map(parseInt)
    res = 0

proc main():int =
    while true:
        for i,v in pairs(a):
            if v mod 2 == 1:
                return res
            a[i] = a[i] div 2
        res += 1

echo main()
