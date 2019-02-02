main :: IO ()
main = do
  let num = 5
  print $ fact num

fact :: Int -> Int
fact 0 = 1
fact n =
  n * fact (n - 1)

