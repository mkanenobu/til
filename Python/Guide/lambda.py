#!/usr/bin/env python3
# coding: utf-8
list1 = list(range(10))
print(list1)

# すべての要素に*3
print(list(map(lambda n: n * 3, list1)))

# 条件が真の要素のみ残す
print(list(filter(lambda n: n < 5, list1)))
