#!/usr/bin/env python3
m, p, q = map(float, input().split())

n = m - (m * p * 0.01)
print(n - (n * q * 0.01))
