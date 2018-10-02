#!/usr/bin/env python3
h, w = map(int, input().split())
dy, dx = map(int, input().split())

print(abs(h * dx) + abs(w * dy) - abs(dx * dy))
