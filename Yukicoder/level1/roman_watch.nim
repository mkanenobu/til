import strutils, sequtils
var
    s,t:string
    time:int
    res:int
(s, t) = readLine(stdin).split

if s == "IX":
    time = 9
else:
    if contains(s, "X"):
        time = 10
    elif contains(s, "V"):
        time = 5
    time += count(s, "I")

res = (time + (t.parseInt mod 12)) mod 12
if res < 1:
    res += 12

if res <= 4:
    echo repeat("I", res)
elif res <= 8:
    echo "V", repeat("I", res - 5)
elif res == 9:
    echo "IX"
else:
    echo "X", repeat("I", res - 10)
