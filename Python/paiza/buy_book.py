#!/usr/bin/env python3
import numpy as np
n = int(input())
s = list(input().split())
m = int(input())
res = [0] * n
op = []
for i in range(0, m):
    op.append(input().split())

for i in range(0, m):
    o = op[i][0]
    p = int(op[i][1])
    res[s.index(o)] += p

for j in range(0, n):
    print(s[np.argmax(res)])
    res[np.argmax(res)] = 0
