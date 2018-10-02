#!/usr/bin/env python3
a, b = map(int, input().split())
n = int(input())
a_list = [0] * n
b_list = [0] * n

for i in range(0, n):
    a_list[i], b_list[i] = map(int, input().split())

for i in range(0, n):
    if a_list[i] < a:
        print("High")
    elif a_list[i] > a:
        print("Low")
    elif a_list[i] == a:
        if b_list[i] > b:
            print("High")
        elif b_list[i] < b:
            print("Low")
