#!/usr/bin/env python3
import numpy as np

a = list(map(int, input().split()))
k = int(input())
for i in range(0, k):
    max_sub = np.argmax(a)
    a[max_sub] = a[max_sub] * 2
print(sum(a))
