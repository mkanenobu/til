import math, algorithm, strutils

proc isPrime*(n: int): bool =
  if n == 2:
    return true
  for i in 2..(n - 1):
    if (n mod i == 0):
      return false
    elif toFloat(i) >= sqrt(n.toFloat):
      return true

