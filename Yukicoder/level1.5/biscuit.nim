import sequtils, strutils, math, algorithm

var n = readLine(stdin).parseInt

if n.isPowerOfTwo:
    echo int(log2(float(n)))
else:
    echo int(log2(float(n))) + 1

