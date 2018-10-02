import sequtils, strutils, algorithm, math

var
  s:string = readLine(stdin)
  c:seq[string] = @[]
  nums:seq[int] = @[]

for i in s:
  c.add($i)

nums = c.map(proc(str:string):int = parseInt(str))
nums.sort(cmp[int])
nums.reverse

echo join(nums)
