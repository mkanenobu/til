import sequtils, strutils, algorithm, math

var
    w = readLine(stdin).parseFloat
    d = readLine(stdin).parseFloat
    yaruki:float

for i in countdown(int(d), 1):
    yaruki = w / pow(float(i), 2)
    w -= floor(yaruki)
    if i == 1:
        echo int(floor(yaruki))
