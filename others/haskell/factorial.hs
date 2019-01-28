main = do
  let num = 8
  print (fact num)

fact n =
  case n of
    0 -> 1
    _ -> n * fact (n - 1)

