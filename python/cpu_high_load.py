#!/usr/bin/python3


def high_load():
    total = 0
    for i in range(0, 20000):
        for j in range(0, 20000):
            total = total + i*j
    print(total)


high_load()
