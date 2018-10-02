#!/usr/bin/env python3
d, t = input().split()
hour = int(t.split(':')[0])
day = int(d.split('/')[1])
if int(t.split(':')[0]) >= 24:
    carry, hour = divmod(int(t.split(':')[0]), 24)
    day += carry
# ゼロ埋め
day = '{0:02d}'.format(day)
hour = '{0:02d}'.format(hour)
print(d.split('/')[0] + '/' + str(day) +
      ' ' + str(hour) + ':' + t.split(':')[1])
