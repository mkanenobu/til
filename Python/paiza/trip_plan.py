#!/usr/bin/env python3
import numpy as np

m, n = map(int, input().split())
d = [0] * m
r = [0] * m
average = []
for i in range(0, m):
    d[i], r[i] = map(int, input().split())

for i in range(0, (m - n)):
    average.append(sum(r[i:i + n]) / n)

start = np.argmin(average)
print(d[start], d[start + n] - 1)
