#!/usr/bin/env python3
n = int(input())
res = 0
list_ = []
for i in range(0, n):
    list_.append(input().split())

for i in range(0, n):
    li = list_[i]
    if sum(map(int, li[1:])) >= 350:
        if li[0] == 'l' and sum(map(int, li[4:6])) >= 160:
            res += 1
        elif li[0] == 's' and sum(map(int, li[2:4])) >= 160:
            res += 1

print(res)
