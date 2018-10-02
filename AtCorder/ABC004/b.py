#!/usr/bin/env python3
import sys

c1 = list(reversed(input().split()))
c2 = list(reversed(input().split()))
c3 = list(reversed(input().split()))
c4 = list(reversed(input().split()))


def echoeach(c):
    for i in range(0, 4):
        sys.stdout.write(c[i])
        if i != 3:
            sys.stdout.write(" ")
        else:
            sys.stdout.write("\n")


echoeach(c4)
echoeach(c3)
echoeach(c2)
echoeach(c1)
