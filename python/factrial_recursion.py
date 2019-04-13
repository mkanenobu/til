#!/usr/bin/env python3
# -*- coding: utf-8 -*-


def fact_rec(n):
    if n <= 0:
        return 1
    else:
        return fact_rec(n - 1) * n


print(fact_rec(100))
