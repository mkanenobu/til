main :: IO ()
main =
  print $ fibo 13

fibo :: Int -> Int
fibo n
  | n == 0 = 0
  | n == 1 = 1
  | otherwise = fibo (n - 1) + fibo (n - 2)
