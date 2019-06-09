#!/usr/bin/env python3
# -*- coding: utf-8 -*-

cube_size = 3

def hyoumen(n: int):
    return n ** 3 - (n - 2) ** 3

print(hyoumen(10))
