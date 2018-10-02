#!/usr/bin/env python3
# -*- coding: utf-8 -*-
a, b = map(int, input().split())
if (a * b) % 2 == 1:
    print("Yes")
else:
    print("No")
