import sequtils, strutils, math

var
  n = readLine(stdin).parseInt
  a:seq[int] = readLine(stdin).split.map(parseInt)
  num:int = 0
  nums:seq[int] = @[]

for i in 1..<n:
  if a[i] == a[i - 1]:
    num += 1
  else:
    nums.add(num)
    num = 0
nums.add(num)
nums = nums.filter(proc(x:int):bool = x != 0)
nums = nums.map(proc(x:int):int = x + 1)
nums = nums.map(proc(x:int):int = int(floor(x / 2)))

echo sum(nums)
