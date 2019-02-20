#!/usr/bin/env python3
import sys

tab_length = 4
for i in sys.argv[1:]:
    opening_file = open(i, "r")
    for line in opening_file:
        sys.stdout.write(line.expandtabs(tab_length))
    opening_file.close()
