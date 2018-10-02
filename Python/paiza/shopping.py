#!/usr/bin/env python3
n = int(input())
v = [0] * n
p = [0] * n
food, book, cloth, other = 0, 0, 0, 0
for i in range(0, n):
    v[i], p[i] = map(int, input().split())

for i in range(0, n):
    if v[i] == 0:
        food += p[i]
    elif v[i] == 1:
        book += p[i]
    elif v[i] == 2:
        cloth += p[i]
    elif v[i] == 3:
        other += p[i]

print((food // 100 * 5) + (book // 100 * 3) +
      (cloth // 100 * 2) + (other // 100 * 1))
