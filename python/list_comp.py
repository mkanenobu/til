#!/usr/bin/env python3
# -*- coding: utf-8 -*-

arr = ["One", "Two", "Three", "Four", "Five"]
for i, v in enumerate(arr):
    print(i, v)

a1 = [i for i in arr]
print(a1)

# with index
a2 = [[i, v] for i, v in enumerate(arr)]
print(a2)

# only 2x
a3 = [i for i in range(10) if i % 2 == 0]
print(a3)

# *100 to 2x
a4 = [i * 100 if i % 2 == 0 else i for i in range(10)]
print(a4)

# Set
s1 = {i % 5 for i in range(100)}
print(s1)
