#!/usr/bin/env python3
# -*- coding: utf-8 -*-

def fibo(n):
    if n <= 1:
        return n
    else:
        return fibo(n - 1) + fibo(n - 2)

print(fibo(10))
