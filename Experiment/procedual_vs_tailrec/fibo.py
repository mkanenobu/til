#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import time


def procedual(n):
    n1 = 0
    n2 = 1
    if n == 0:
        return 0
    else:
        for i in range(1, n):
            (n1, n2) = (n2, (n1 + n2))
        return n2


def tail_recursion(n, n1=0, n2=1):
    if n == 0:
        return n1
    else:
        return tail_recursion(n - 1, n2, (n1 + n2))


sTime1 = time.time()
tail_recursion(100)
eTime1 = time.time() - sTime1
print(eTime1)

sTime2 = time.time()
procedual(100)
eTime2 = time.time() - sTime2
print(eTime2)
