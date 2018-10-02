#!/usr/bin/env python3
n = int(input())
countries = []
for i in range(0, n):
    country = list(map(int, input().split()))
    countries.append(country)

print(countries)
