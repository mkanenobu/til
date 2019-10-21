#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import math
import sys

args = sys.argv

if len(args) != 3:
    print("ratio.py [PARAMETER1] [PARAMETER2]")

n1 = int(args[1])
n2 = int(args[2])

diviser = math.gcd(n1, n2)
print(n1 / diviser, "x", n2 / diviser)
