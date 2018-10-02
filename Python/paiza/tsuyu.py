#!/usr/bin/env python3
a = list(map(int, input().split()))
if a.count(1) >= 5:
    print("yes")
else:
    print("no")
