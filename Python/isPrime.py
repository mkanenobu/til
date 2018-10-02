#!/usr/bin/env python3
import sys
import math

num = int(sys.argv[1])
''' comment'''


def prime_test(n):
    if n == 2:
        return ("2 is prime number!")
    for i in range(2, n - 1):
        if (n % i == 0):
            return ("%i is not prime number." % (n))
        elif i >= math.sqrt(n):
            return ("%i is prime number!" % (n))


print(prime_test(num))
