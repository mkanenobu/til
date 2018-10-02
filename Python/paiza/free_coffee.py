#!/usr/bin/env python3
x, p = map(int, input().split())
res = 0

while x > 0:
    res += x
    x = int(x - (x * (p / 100)))

print(res)
