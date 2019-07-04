#!/usr/bin/env python3
# -*- coding: utf-8 -*-


def is_zero(x):
    # Guard
    is_zero.result = x if x == 0 else None
    return is_zero.result


n = 1
if is_zero(n) is None:
    print('n is not zero')
