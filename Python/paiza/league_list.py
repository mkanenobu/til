#!/usr/bin/env python3
n = int(input())
winner = []
res = [[0 * n] * n]
m = int((n * (n - 1)) / 2)
for i in range(0, m):
    winner.append(list(map(int, input().split())))

for i in range(0, m):

