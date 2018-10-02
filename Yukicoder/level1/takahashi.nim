import sequtils, strutils, math

var
    n = readLine(stdin).parseInt
    input = newSeqWith(n, newSeq[string](2))
    miss = 0

for i in 0..<n:
    input[i] = (readLine(stdin).split)

proc main():int =
    for i in input:
        var
            t = i[0].parseFloat
            s = len(i[1])
        if (12 / 1000) * t >= float(s):
            result += s
        else:
            miss += s - int(floor(t / (1000 / 12)))
            result += int(floor(t / (1000 / 12)))

echo main(), " ", miss
