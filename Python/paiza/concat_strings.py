#!/usr/bin/env python3
# -*- coding: utf-8 -*-
n = int(input())
w = [input() for i in range(n)]
res = w[0]

for i in range(1, n):
    w1 = w[i]
    for j in range(1, (min(len(w1), len(res)) + 1)):
        if res[-(j):] == w1[:j]:
            res += w1[j:]
            break
        elif res[-(j):] != w1[:j]:
            continue
    else:
        res += w1

print(res)
