main = do
  putStrLn "input language:"
  input <- getLine
  printGreeting input
  
  putStrLn "input num:"
  num <- getLine
  putStrLn (checkNum num)

printGreeting greeting = do
  if greeting == "english"
    then do
      putStrLn "Hello"
    else do
      putStrLn "こんにちは"

checkNum num =
  if num == "0"
    then "zero"
    else "not zero"
