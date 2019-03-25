main :: IO ()
main = do
  -- first element of tuple
  print $ fst oneTwo
  -- second element of tuple
  print $ snd oneTwo

oneTwo :: (Int, Int)
oneTwo = (1, 2)
