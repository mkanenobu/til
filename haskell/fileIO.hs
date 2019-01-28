main = do
  i <- readFile "sample.txt"
  putStrLn i
  writeFile "output.txt" "string"
