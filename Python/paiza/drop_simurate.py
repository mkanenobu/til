#!/usr/bin/env python3
import sys
h, w, n = map(int, input().split())
heights = [0] * n
width = [0] * n
margin = [0] * n
field = ['.' * w] * h
for i in range(0, n):
    heights[i], width[i], margin[i] = map(int, input().split())

for i in range(0, n):
    for j in range(0, n):
        field[i][j] = 
