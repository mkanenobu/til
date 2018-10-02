import sequtils, strutils

var
    i = readLine(stdin).parseInt
    n:seq[int] = @[]

for j in 0..<i:
    n.add(readLine(stdin).parseInt)

for k in n:
    if k mod 40 == 0:
        echo "ikisugi"
    elif k mod 10 == 0:
        echo "sugi"
    elif k mod 8 == 0:
        echo "iki"
    else:
        echo (k div 3)
