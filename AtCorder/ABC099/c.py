#!/usr/bin/env python3
n = int(input())
six = [1]
nine = [1]
res = 0
for i in range(1, n):
    num = 6 ** i
    if num > n:
        break
    six.append(num)

for j in range(1, n):
    num = 9 ** j
    if num > n:
        break
    nine.append(num)

print(six, nine)
while n != 0:
    six = list(filter(lambda x: x <= n, six))
    nine = list(filter(lambda x: x <= n, nine))
    n -= max(max(six), max(nine))
    res += 1
    print(n, res)

print(res)
