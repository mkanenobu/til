main :: IO ()
main =
  -- print 123::Int
  print $ strToInt "123"

-- String to Int
strToInt :: String -> Int
strToInt s =
  read s::Int
