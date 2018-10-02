#!/usr/bin/env python3
n = int(input())
a = []

for i in range(0, n):
    a.append(input())

for i in range(0, n):
    if a[i][-1] in ["s", "o", "x"]:
        print(a[i] + "es")
    elif a[i][-2:] in ["sh", "ch"]:
        print(a[i] + "es")
    elif a[i][-1] == "f":
        print(a[i][0:-1] + "ves")
    elif a[i][-2:] == "fe":
        print(a[i][0:-2] + "ves")
    elif (a[i][-2:])[1] == "y" and (a[i][-2:])[0] not in ["a", "i", "u", "e", "o"]:
        print(a[i][0:-1] + "ies")
    else:
        print(a[i] + "s")
