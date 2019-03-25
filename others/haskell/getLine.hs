
main :: IO ()
main = do
  -- getLine :: IO String
  -- words: Stringを空白、改行で[String]に
  l <- words <$> getLine
  print l

