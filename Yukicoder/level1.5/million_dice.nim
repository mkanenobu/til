import sequtils, strutils, algorithm, math

var
    n = readLine(stdin).parseFloat
    maximum = n * 6
    res:float

for i in int(n)..int(maximum):
    res += float(i) * (1 / (pow(n, n)))
