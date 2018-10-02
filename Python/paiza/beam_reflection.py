#!/usr/bin/env python3
h, w = map(int, input().split())
layer = []
x = 0
y = 0
course = 0  # 0,右 1,下 2.左 3,上
res = 0
for i in range(0, h):
    layer.append(input())

while 0 <= x < h and 0 <= y < w:
    if layer[x][y] == '\\':
        if course == 0:
            course = 1
        elif course == 1:
            course = 0
        elif course == 2:
            course = 3
        elif course == 3:
            course = 2
    elif layer[x][y] == '/':
        if course == 0:
            course = 3
        elif course == 1:
            course = 2
        elif course == 2:
            course = 1
        elif course == 3:
            course = 0
    if course == 0:
        y += 1
    elif course == 1:
        x += 1
    elif course == 2:
        y -= 1
    elif course == 3:
        x -= 1
    res += 1

print(res)
