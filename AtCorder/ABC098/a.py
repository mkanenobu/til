#!/usr/bin/env python3
a, b = map(int, input().split())
print(max(a + b, a - b, a * b))
