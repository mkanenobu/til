#!/usr/bin/env python3
xc, yc, r_1, r_2 = map(int, input().split())
n = int(input())
xy = []
for i in range(0, n):
    xy.append(list(map(int, input().split())))

for i in range(0, n):
    if (abs(xy[i][0]) - abs(xc)) + (abs(xy[i][1]) - abs(yc) >= r_1):
        if (abs(xy[i][0]) - abs(xc)) + (abs(xy[i][1]) - abs(yc)) <= r_2:
            print("yes")
    else:
        print("no")
