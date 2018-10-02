#!/usr/bin/env python3
a = list(map(int, input().split()))
n = int(input())
nums = []
for i in range(0, n):
    nums.append(list(map(int, input().split())))


for i in range(0, n):
    res = 0
    for j in range(0, 6):
        if nums[i][j] in a:
            res += 1
    print(res)
