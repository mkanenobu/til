import sequtils, strutils, math, parseutils

var
    h,w,n,k,area,res:int64
(h,w,n,k) = readLine(stdin).split.map(parseBiggestInt)
area = h * w
res = area mod n
if res == 0: res = n

if res == k:
    echo "YES"
else:
    echo "NO"
