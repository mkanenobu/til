#!/usr/bin/env python3


def fibonacci():
    a, b = 0, 1
    print("Fibonacci")
    print("0")
    for i in range(0, 100):
        print(b)
        a, b = b, a + b
#        if b > 50000:
#            print("Over 50000")
#            break


fibonacci()
