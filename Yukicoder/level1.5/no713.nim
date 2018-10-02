import sequtils, strutils, algorithm, math

var
  n = readLine(stdin).parseInt
  primes:seq[int] = @[]

proc isPrime(n: int): bool =
  if n == 2:
    return true
  for i in 2..(n - 1):
    if (n mod i == 0):
      return false
    elif toFloat(i) >= sqrt(n.toFloat):
      return true

for i in 2..n:
  if isPrime(i):
    primes.add(i)

echo sum(primes)
