#!/usr/bin/env python3
a, b = input().split()
a_ = []
b_ = []
a_sum = 0
b_sum = 0


def nsin(x, n):
    if(int(x / n)):
        return nsin(int(x / n), n)+str(x % n)
    return str(x % n)


for i in a:
    a_.append(ord(i) - 65)

for j in b:
    b_.append(ord(j) - 65)

n = len(a_) - 1
for i in a_:
    a_sum += i * (5 ** n)
    n -= 1

n = len(b_) - 1
for j in b_:
    b_sum += j * (5 ** n)
    n -= 1

res = a_sum + b_sum
res = nsin(res, 5)

ans = ""
for k in res:
    ans = ans + chr(int(k) + 65)

print(ans)
