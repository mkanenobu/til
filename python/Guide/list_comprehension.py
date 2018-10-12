#!/usr/bin/env python3
# 1から9までのリスト
a = [i for i in range(1, 10)]
print(a)

# 奇数だけ取り出す
a = list(filter(lambda x: x % 2 == 1, a))
print(a)

# 上2つを1行で
b = list(filter(lambda x: x % 2 == 0, [i for i in range(0, 101)]))
print(b)
