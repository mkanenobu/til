#!/usr/bin/env python3
s, a, b = map(int, input().split())
i = 0
res = ""
while True:
    if i % 2 == 0:
        s += 10
    elif i % 2 == 1:
        s += 1000
    if s >= a or s >= b:
        break
    i += 1

if s > max(a, b):
    if i % 2 == 0:
        res = "B"
        s -= 10
        print(res, s)
    elif i % 2 == 1:
        res = "A"
        s -= 1000
        print(res, s)
else:
    if max(a, b) == a:
        res = "A"
    else:
        res = "B"
    print(res, str(s))
