#!/usr/bin/env python3
n, s, p = map(int, input().split())
res = []
weight = []
sugar = []
for i in range(0, n):
    lis = list(map(int, input().split()))
    weight.append(lis[0])
    sugar.append(lis[1])

for i in range(0, n):
    if sugar[i] >= s - p and sugar[i] <= s + p:
        res.append(i)

for j in range(0, n):
    if weight.index(max(weight)) not in res:
        weight[weight.index(max(weight))] = 0
    else:
        print(weight.index(max(weight)) + 1)
        break
else:
    print("not found")
