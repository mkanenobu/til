# Bench

proc ack(m, n: int): int =
  if m == 0:
    n + 1
  elif n == 0:
    ack(m - 1, 1)
  else:
    ack(m - 1, ack(m, n - 1))

echo ack(2, 2)
