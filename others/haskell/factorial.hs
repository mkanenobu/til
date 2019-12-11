import System.Environment (getArgs)

convert :: String -> Int
convert x = read x :: Int

main :: IO ()
main = do
  args <- getArgs
  let num = convert $ args !! 0
  print $ fact num

fact :: Int -> Int
fact n
  | n == 0 = 1
  | otherwise = n * fact (n - 1)

