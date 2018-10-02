#!/usr/bin/env python3
# -*- coding: utf-8 -*-

n = int(input())
g = input()
s = []
count = 0

for i in range(0, n):
    s.append(input())

for i in range(0, n):
    if s[i].find(g) != -1:
        print(s[i])
        count += 1

if count == 0:
    print("None")
