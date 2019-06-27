#!/usr/bin/env python3
# -*- coding: utf-8 -*-

def tarai(x, y, z):
    if x <= y:
        return y
    else:
        return tarai(tarai(x - 1, y, z), tarai(y - 1, z, x), tarai(z - 1, x, y))

tarai(12, 6, 0)
