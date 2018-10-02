#!/usr/bin/env python3
import sys
n = int(input())
res = int((n * (n ** 2 + 1)) / 2)
m = []
for i in range(0, n):
    m.append(list(map(int, input().split())))
k = 0
n1 = []
n2 = []

for i in range(0, n):
    if sum(m[i]) != res:
        n1.append(i)
        n2.append(sum(m[i]))

if len(n1) == 2:
    for i in range(0, n):
        for j in range(0, n):
            if m[i][j] == 0:
                m[i][j] = res - n2[k]
                k += 1
            if j == n - 1:
                sys.stdout.write(str(m[i][j]))
                print()
            else:
                sys.stdout.write(str(m[i][j]) + " ")

elif len(n1) == 1:
    n1 = []
    n2 = []
    k = 0
    for i in range(0, n):
        n3 = 0
        for j in range(0, n):
            n3 += m[j][i]
        if n3 < res:
            n1.append(i)
            n2.append(n3)
    for i in range(0, n):
        for j in range(0, n):
            if m[i][j] == 0:
                m[i][j] = res - n2[k]
                k += 1
            if j == n - 1:
                sys.stdout.write(str(m[i][j]))
                print()
            else:
                sys.stdout.write(str(m[i][j]) + " ")
