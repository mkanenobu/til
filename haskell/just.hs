import Data.Typeable

main :: IO ()
main = do
  let a = return 3::Maybe Int -- Maybeモナド
      b = Just 1
      c = Just 3
  print $ if c == a then "true" else "false"
  print (a, b)
  print $ typeOf a

