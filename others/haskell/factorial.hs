main :: IO ()
main = do
  let num = 5
  print $ fact num

fact :: Int -> Int
fact n
  | n == 0 = 1
  | otherwise = n * fact (n - 1)

