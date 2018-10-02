#!/usr/bin/env python3
n = int(input())
qa = []
res = 0
for i in range(0, n):
    qa.append(list(input().split()))

for i in range(0, n):
    li = qa[i]
    if li[0] == li[1]:
        res += 2
    elif len(li[0]) != len(li[1]):
        res += 0
    else:
        d = 0
        for j in range(0, len(li[0])):
            if li[0][j] != li[1][j]:
                d += 1
        if d == 1:
            res += 1

print(res)
