#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import sys

args = sys.argv

for arg in args[1]:
    for i in arg:
        print(format(ord(i), 'x').upper(), end=" ")

print("")
