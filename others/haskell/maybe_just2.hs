main :: IO ()
main = do
  print $ fact 13
  print $ fact (-1)
  print $ fibo 13
  print $ fibo (-1)
  print $ isNothing $ fibo (-1)

fact :: Int -> Maybe Int
fact 0 = Just 1
fact n
  | n > 0 = (n *) <$> fact (n - 1)
  | otherwise = Nothing

fibo :: Int -> Maybe Int
fibo n
  | n == 0 = Just 0
  | n == 1 = Just 1
  | n > 1  = (+) <$> (fibo (n - 1)) <*> (fibo (n - 2))
  | otherwise = Nothing

isNothing :: Maybe a -> Bool
isNothing Nothing = True
isNothing _ = False
