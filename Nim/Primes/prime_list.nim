import strutils,math,os
var n_limit:int = 10
if paramCount() == 0:
    echo "Input number"
    quit 1
else:
    n_limit = commandLineParams()[0].parseInt

for n in 1..n_limit:
    if n == 1: discard
    elif n == 2: echo n
    block block1:
        for i in 2..<n:
            if n mod i == 0:
                break block1
            elif toFloat(i) >= sqrt(n.toFloat):
                echo n
                break block1

