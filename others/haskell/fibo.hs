main = do
  print (fibo 13)

fibo n = do
  case n of
    0 -> 0
    1 -> 1
    _ -> (fibo (n - 1) + fibo (n - 2))
