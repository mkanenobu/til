main :: IO ()
main =
  -- print 123::Int
  print $ str_to_int "123"

-- String to Int
str_to_int :: String -> Int
str_to_int s =
  read s::Int
