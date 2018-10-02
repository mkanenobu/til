#!/usr/bin/env python3
n = int(input())
s = []
for i in range(0, n):
    s.append(input().split())
n1 = 0
n2 = 0
for i in range(0, n):
    o = s[i]
    if o[0] == "SET":
        if o[1] == '1':
            n1 = int(o[2])
        elif o[1] == '2':
            n2 = int(o[2])
    elif o[0] == "ADD":
        n2 = n1 + int(o[1])
    elif o[0] == "SUB":
        n2 = n1 - int(o[1])

print(n1, n2)
