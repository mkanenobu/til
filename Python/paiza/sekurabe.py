#!/usr/bin/env python3
n = int(input())
c = [0] * n
h = [0] * n
for i in range(0, n):
    c[i], h[i] = input().split()

taller = []
smaller = []

for i in range(0, n):
    if c[i] == "le":
        taller.append(float(h[i]))
    elif c[i] == "ge":
        smaller.append(float(h[i]))

print(max(smaller), min(taller))
