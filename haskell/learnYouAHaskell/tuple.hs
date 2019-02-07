main :: IO ()
main = do
  -- print $ [(1,2),(1,2,3),(4,5)] -- Error
  -- print $ [(1,2),("string",2)] -- Error
  print $ [(0,1,2),(3,4,5)]
