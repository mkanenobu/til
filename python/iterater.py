#!/usr/bin/env python3
# -*- coding: utf-8 -*-

arr = ["One", "Two", "Three", "Four", "Five"]

for i in arr:
    print(i)

# with index
for i, v in enumerate(arr):
    print(i, v)


# with index starts 3
for i, v in enumerate(arr, start=3):
    print(i, v)
