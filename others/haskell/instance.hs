main :: IO ()
main =
  print $ square 3

square :: (Num a) => a -> a
square x = x * x
