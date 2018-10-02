#!/usr/bin/env python3
n = int(input())
s = input()
counted = []
for i in range(1, n):
    c = 0
    counted_char = []
    for j in s[:i]:
        if j in s[i:] and j not in counted_char:
            c += 1
            counted_char.append(j)
    counted.append(c)

print(max(counted))
