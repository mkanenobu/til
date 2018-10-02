import sequtils, strutils, math

var
    f1,f2,f3,n:int
    f = readLine(stdin).split.map(parseInt)
(f1, f2, n) = f
f3 = f1 xor f2

proc main():int =
    n = n mod 3
    if n == 0: return f1
    elif n == 1: return f2
    elif n == 2: return f3

echo main()
