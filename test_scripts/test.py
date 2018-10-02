#!/usr/bin/env python3
# -*- coding: utf-8 -*-
n = int(input())
w = [input() for i in range(n)]
res = w[0]

for i in range(1, n - 1):
    for j in range(0, min(len(w[i], w[i + 1]))):

