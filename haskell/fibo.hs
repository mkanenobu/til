main :: IO ()
main =
  print $ fibo 13

fibo :: Int -> Int
fibo | 
n =
  fibo (n - 1) + fibo (n - 2)
