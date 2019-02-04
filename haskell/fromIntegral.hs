main :: IO ()
main = do
  print (a * b)
  print (a / b)
  print (fromIntegral(c) / b)
    where
      a = 10::Float
      b = 3::Float
      c = 10::Int
