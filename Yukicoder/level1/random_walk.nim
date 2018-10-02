import sequtils, strutils

var
    t = readLine(stdin).parseInt
    x:seq[int] = @[]

for i in 0..<t:
    x.add(readLine(stdin).parseInt)

proc main():string =
    for j,v in x:
        if j == 0:
            if not (v == 1 or v == -1):
                return "F"
            continue
        if abs(v - x[j - 1]) != 1:
            return "F"
    return "T"

echo main()
