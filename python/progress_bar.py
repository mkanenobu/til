#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import time

from progressbar import ProgressBar

p = ProgressBar(100)

for i in range(100):
    p.update(i + 1)
    time.sleep(0.01)
