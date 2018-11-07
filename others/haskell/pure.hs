main = do
  let message = getStr "Num is" 10
  putStrLn message

getStr string number = str ++ num
  where
    str = string ++ " "
    num = show number
