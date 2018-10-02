#!/usr/bin/env python3
n = int(input())
dp = []
point = 0
for i in range(0, n):
    dp.append(list(input().split()))

for i in range(0, n):
    date = dp[i][0]
    price = int(dp[i][1])
    if date.count('3'):
        point += int(price * 0.03)
    elif date.count('5'):
        point += int(price * 0.05)
    else:
        point += int(price * 0.01)

print(point)
