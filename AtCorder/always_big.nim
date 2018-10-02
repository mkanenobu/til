import strutils,sequtils,algorithm
var XY: seq[int] = (stdin.readLine).split(" ").map(parseInt)
#    X = XY[0]
#    Y = XY[1]
#if X > Y:
#    echo X
#else:
#    echo Y
echo max XY
