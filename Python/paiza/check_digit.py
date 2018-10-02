#!/usr/bin/python3
# correct

n = int(input())
a = []
for i in range(0, n):
    a.append(input()[0:15])

for i in range(0, n):
    odd = 0
    even = 0
    for j in reversed(range(0, 15)):
        num = int(a[i][j])
        if j % 2 == 0:
            if num * 2 >= 10:
                num = int(str(num * 2)[0]) + int(str(num * 2)[1])
                even = even + num
            else:
                even = even + num * 2
        else:
            odd = odd + num
    res = 10 - ((odd + even) % 10)
    if res == 10:
        print(0)
    else:
        print(res)
