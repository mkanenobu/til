#!/usr/bin/env python3
nums = list(map(int, input().split()))
nums[1], nums[2], nums[3], nums[4], nums[5] = nums[2], nums[5], nums[4], nums[3], nums[1]
n = int(input())
p = []
res = 0
for i in range(0, n):
    p.append(int(input()))

curSide = 0
for i in range(1, n):
    nextSide = nums.index(p[i])
    if nextSide != curSide:
        if nextSide + curSide == 5:
            res += 2
        else:
            res += 1
    curSide = nextSide

print(res)
