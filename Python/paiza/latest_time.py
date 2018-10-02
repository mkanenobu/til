#!/usr/bin/env python3
a, b, c = map(int, input().split())
n = int(input())
t = []
for i in range(0, n):
    t.append(list(map(int, input().split())))

limit = 9 * 60
for i in range((n - 1), -1, -1):
    t_minute = t[i][0] * 60 + t[i][1]
    if t_minute + b + c < limit:
        t_minute -= a
        print('{0:02d}'.format(t_minute // 60) +
              ':' + '{0:02d}'.format(t_minute % 60))
        break
