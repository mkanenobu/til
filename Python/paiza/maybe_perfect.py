#!/usr/bin/env python3

q = int(input())
n = []
for i in range(0, q):
    n.append(int(input()))

for i in range(0, q):
    num = n[i]
    div_nums = 0
    for j in range(1, num):
        if num % j == 0:
            div_nums += j
    if num == div_nums:
        print("perfect")
    elif abs(num - div_nums) == 1:
        print("nearly")
    else:
        print("neither")
