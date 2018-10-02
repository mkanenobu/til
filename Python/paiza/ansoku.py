#!/usr/bin/python3
a, b, r = map(int, input().split())
n = int(input())
x = []
y = []
for i in range(0, (n - 1)):
    x[i], y[i] = map(int, input().split())

print(x)
print(y)
