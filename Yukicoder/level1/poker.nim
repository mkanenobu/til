import strutils, sequtils

var
    a = readLine(stdin).split.map(parseInt)
    res:seq[int] = @[]

for i in a:
    res.add(count(a, i))

if count(res,2) == 2:
    if count(res,3) == 3:
        echo "FULL HOUSE"
    else:
        echo "ONE PAIR"
elif count(res,2) == 4:
    echo "TWO PAIR"
elif count(res,3) == 3:
    echo "THREE CARD"
else:
    echo "NO HAND"
