#!/usr/bin/env python3
# 愚直解
k, s, t = map(int, input().split())
res = "ABC"
for i in range(1, k):
    res = 'A' + res + 'B' + res + 'C'

print(res[(s - 1):t])
