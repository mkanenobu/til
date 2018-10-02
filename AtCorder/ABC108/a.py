#!/usr/bin/env python3
# -*- coding: utf-8 -*-
k = int(input())
even = k // 2
odd = even

if k % 2 == 1:
    odd = even + 1

print(odd * even)
