import strutils
var
    dist: float = readLine(stdin).parseFloat / 1000
    VV: int
if dist < 0.1:
    VV = 00
elif 5 >= dist:
    VV = toInt(dist * 10)
elif 30 >= dist:
    VV = toInt(dist + 50)
elif 70 >= dist:
    VV = toInt(( dist - 30 ) / 5 + 80)
elif 70 <= dist:
    VV = 89

if VV <= 9:
    echo 0,VV
else:
    echo VV
