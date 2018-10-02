#!/usr/bin/env python3
# -*- coding: utf-8 -*-
x1, y1, x2, y2 = map(int, input().split())
x_len = x1 - x2
y_len = y1 - y2

x3 = x2 + y_len
y3 = y2 - x_len
x4 = x3 + x_len
y4 = y3 + y_len

print(x3, y3, x4, y4)
