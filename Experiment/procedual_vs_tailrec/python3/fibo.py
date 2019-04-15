#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import time


def procedual(n):
    acc1 = 0
    acc2 = 1
    if n == 0:
        return 0
    else:
        for i in range(1, n):
            (acc1, acc2) = (acc2, (acc1 + acc2))
        return acc2


def tail_recursion(n, acc1=0, acc2=1):
    if n == 0:
        return acc1
    else:
        return tail_recursion(n - 1, acc2, (acc1 + acc2))


sTime1 = time.time()
tail_recursion(100)
eTime1 = time.time() - sTime1
print(eTime1)

sTime2 = time.time()
procedual(100)
eTime2 = time.time() - sTime2
print(eTime2)
