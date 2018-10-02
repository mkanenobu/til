import sequtils, strutils

var
    n = readLine(stdin).parseInt
    a:seq[int] = readLine(stdin).split.map(parseInt)
    ans = 0

for i in 2..<n:
    var
        left = a[i - 2]
        center = a[i - 1]
        right = a[i]
    if (center < left and center < right) or (center > left and center > right):
        if left != right:
            ans += 1

echo ans
