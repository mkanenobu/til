import strutils, sequtils
var s:seq[string] = @[]
for i in 0..2:
    s.add(readLine(stdin))

if (count(s, "RED") > count(s, "BLUE")):
    echo "RED"
else:
    echo "BLUE"
