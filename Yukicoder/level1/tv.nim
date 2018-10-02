import strutils, sequtils

var h,w:int
(h, w) = readLine(stdin).split.map(parseInt)

if h < w:
    echo "YOKO"
else:
    echo "TATE"
