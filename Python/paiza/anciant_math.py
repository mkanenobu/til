#!/usr/bin/env python3
input_line = list(input().split("+"))
res = 0
for i in input_line:
    for j in i:
        if j == "/":
            res += 1
        elif j == "<":
            res += 10

print(res)
