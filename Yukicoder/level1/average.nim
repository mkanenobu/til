import sequtils, strutils, algorithm, math

var
    n = readLine(stdin).parseInt
    k = readLine(stdin).parseInt
    nums:seq[int] = @[]
    lists = newSeqWith(k, newSeq[int]())
    listPer:int

for i in 0..<n:
    nums.add(readLine(stdin).parseInt)
sort(nums, cmp[int])

proc average(x:seq[int]):float =
    return sum(x) / len(x)

listPer = int(ceil(n / k))

for i,v in nums:
    lists[i] = @[v, nums[^i]]
