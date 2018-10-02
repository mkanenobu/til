#!/usr/bin/env python3
# coding: utf-8

# 初乗り距離 a_i、 初乗り運賃 b_i、 加算距離 c_i、 加算運賃 d_i
import math

n, x = map(int, input().split())
a = [0] * n
b = [0] * n
c = [0] * n
d = [0] * n
res = [0] * n

for i in range(0, n):
    a[i], b[i], c[i], d[i] = map(int, input().split())

for i in range(0, n):
    if x < a[i]:
        res[i] = b[i]
    else:
        over = int(math.ceil((x - a[i]) / c[i]))
        if (x - a[i]) % c[i] == 0:
            over += 1
        res[i] = b[i] + (over * d[i])

print(min(res), max(res))
