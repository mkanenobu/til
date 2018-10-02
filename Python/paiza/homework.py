#!/usr/bin/env python3

a, op, b, eq, c = input().split()
if a == 'x':
    if op == '+':
        print(int(c) - int(b))
    elif op == '-':
        print(int(b) + int(c))
elif b == 'x':
    if op == '+':
        print(int(c) - int(b))
    elif op == '-':
        print(int(a) - int(c))
else:
    if op == '+':
        print(int(a) + int(b))
    elif op == '-':
        print(int(a) - int(b))
