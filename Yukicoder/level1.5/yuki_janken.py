#!/usr/bin/env python3

a = input().split()
b = input().split()
a_point = int(a[1])
b_point = int(b[1])

if a_point == b_point:
    print(-1)
elif max(a_point, b_point) == a_point:
    print(a[0])
else:
    print(b[0])
