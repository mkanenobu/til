import sequtils, strutils

var
    input = readLine(stdin).split
    w,h:int
    c:string
    pattern:string

(w, h) = input[0..1].map(parseInt)
c = input[2]

if c == "W": pattern = repeat("WB", 26)
else: pattern = repeat("BW", 26)

for j in 0..<h:
    if j mod 2 == 0:
        echo pattern[0..<w]
    elif j mod 2 == 1:
        echo pattern[1..w]
