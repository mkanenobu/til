main :: IO ()
main = do
  let a = return 1 :: Maybe Int
      b = Just 1
  {-
    List, Maybe
    --|--
    [], Nothing
    [x], Just x
    [x, y], 該当なし
  -}
  print (a, b)
