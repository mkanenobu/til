import sequtils, strutils, math

var
    s:string = readLine(stdin)
    b:seq[string] = @[]
    stones:int

for i in 0..<8:
    b.add(readLine(stdin))

for i in b:
    for j in i.items:
        if j.in(['w','b']):
            stones += 1

if stones mod 2 == 0:
    if s == "yukiko":
        echo "yukiko"
    else:
        echo "oda"
elif stones mod 2 == 1:
    if s == "yukiko":
        echo "oda"
    else:
        echo "yukiko"
