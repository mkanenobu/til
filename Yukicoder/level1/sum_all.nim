import sequtils, strutils, math

var
    s = readLine(stdin)
    nums: seq[int] = @[]

for i in s:
    if isDigit(i):
        nums.add(($i).parseInt)

echo sum(nums)
