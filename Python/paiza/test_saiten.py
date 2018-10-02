#!/usr/bin/env python3
# -*- coding: utf-8 -*-
n, m = map(int, input().split())
a = []
b = []
for i in range(0, n):
    var = list(map(int, input().split()))
    a.append(var[0])
    b.append(var[1])

for i in range(0, n):
    if m <= (a[i] - (b[i] * 5)):
        print(i + 1)
