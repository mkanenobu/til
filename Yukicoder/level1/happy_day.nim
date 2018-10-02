import sequtils, strutils, math

var
    res = 0
    days:int

for i in 1..12:
    if i.in([4,6,9,11]): days = 30
    elif i == 2: days = 28
    else: days = 31
    for j in 1..days:
        if i == (j div 10) + parseInt(($j)[^1..^1]):
            res += 1

echo res
