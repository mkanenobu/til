#!/usr/bin/env python3
nums = input().split()
nums.sort()
print(int(nums[-1]) * 10 + int(nums[0]) + int(nums[-2]) * 10 + int(nums[1]))
