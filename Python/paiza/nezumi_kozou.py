#!/usr/bin/env python3
h, w = map(int, input().split())
h_loc, w_loc = map(int, input().split())
h_loc -= 1
w_loc -= 1
s = []
direction = 0  # 0,上 1,右 2,下 3,左
for i in range(0, h):
    s.append(list(input().split()))
# . 庶民
# * 富豪
while h_loc <= h and h_loc > 0 and w_loc <= w and h_loc > 0:
    print(s[h_loc][0][w_loc])
    if s[h_loc][0][w_loc] == '.':
        s[h_loc][0][w_loc] = '*'
        direction += 1
    elif s[h_loc][0][w_loc] == '*':
        s[h_loc][0][w_loc] = '.'
        direction -= 1

    direction = 3 if direction == -1 else direction
    direction = 0 if direction == 4 else direction

    if direction == 0:
        h_loc -= 1
    elif direction == 1:
        w_loc += 1
    elif direction == 2:
        h_loc += 1
    elif direction == 3:
        w_loc -= 1

for i in range(0, h):
    print(s[i])
