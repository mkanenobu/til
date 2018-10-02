#!/usr/bin/env python3
# coding: utf-8
l1 = list(map(int, input().split()))
l1 = sorted(l1)

print((l1[1] - l1[0]) + (l1[2] - l1[1]))
