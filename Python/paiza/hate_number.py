#!/usr/bin/env python3
n = input()
m = int(input())
r = []
res = 0
for i in range(0, m):
    r.append(int(input()))

for i in range(0, m):
    if str(r[i]).count(n) == 0:
        print(r[i])
        res += 1
if res == 0:
    print("none")
