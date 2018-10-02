#!/usr/bin/env python3

n = int(input())
f = [1]
m = 0
for i in range(0, n):
    f.append(int(input()))

for i in range(0, n):
    m += abs(f[i] - f[i + 1])

print(m)
