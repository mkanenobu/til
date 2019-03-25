main :: IO ()
main = do
  print $ power 2 2
  print $ power 2 10
  print $ power 3 (-1)

power :: Int -> Int -> Int
power a n
  | n == 0 = 1
  | n < 0  = error "Error"
  | otherwise = a * (power a (n - 1))
