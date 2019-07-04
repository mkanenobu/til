#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import random

for _ in range(10):
    n = random.random()
    # print when n is lager than 0.5
    print(n) if n > 0.5 else None
