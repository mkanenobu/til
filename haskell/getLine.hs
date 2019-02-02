
main :: IO ()
main = do
  -- getLine :: IO String
  -- words: Stringを空白で[String]に
  l <- words <$> getLine
  print l

