#!/usr/bin/env python3
# coding: utf-8
s = input()
underbar = s.count("_")
hyphen = s.count("-")
if hyphen > underbar:
    print(s.replace("_", "-"))
else:
    print(s.replace("-", "_"))
