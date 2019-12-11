#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import sys

args = sys.argv

if len(args) > 2:
    sys.exit(1)
elif len(args[1]) > 1:
    sys.exit(1)

print(ord(args[1]))
