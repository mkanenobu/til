#!/usr/bin/env python3
n = int(input())
s = []
for i in range(0, n):
    s.append(list(map(int, input().split())))

h = 0
l = 1000000
st = s[0][0]
e = s[-1][1]
for i in range(0, n):
    li = s[i]
    if h < li[2]:
        h = li[2]
    if l > li[3]:
        l = li[3]

print(st, e, h, l)
