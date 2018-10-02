#!/usr/bin/env python3
p = list(map(int, input().split()))
p.append(list(map(int, input().split())))
e = list(map(int, input().split()))
f = list(map(int, input().split()))
res = []

res.append(e.index(max(e)))
e[res[0]] = 0
res.append(e.index(max(e)))
print(res)
res = sorted(res)
print(res)
print(res[f.index(max(f))])
print(res[f.index(min(f))])
