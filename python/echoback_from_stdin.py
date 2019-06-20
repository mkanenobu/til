#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys


def input_lines1():
    # こちらは改行が含まれる
    res = []
    for line in sys.stdin:
        res.append(line)
    print(res)


def input_lines2():
    # こちらは改行が含まれない
    res = []
    try:
        while True:
            res.append(input())
    except EOFError:
        print(res)


input_lines1()
input_lines2()
