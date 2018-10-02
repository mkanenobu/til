import sequtils, strutils, algorithm
var
    h,n:int
    heights:seq[int] = @[]
(h,n) = readLine(stdin).split.map(parseInt)
heights.add(h)

for i in 0..<(n - 1):
    heights.add(readLine(stdin).parseInt)

sort(heights, cmp[int])
for i,v in reversed(heights):
    var res = $(i + 1)
    if v == h:
        if res[^1] == '1':
            echo res, "st"
        elif res[^1] == '2':
            echo res, "nd"
        elif res[^1] == '3':
            echo res, "rd"
        else:
            echo res, "th"
