main = do
  let a = return 1 :: Maybe Int -- Maybeモナド
      b = Just 1
  print(a, b)
