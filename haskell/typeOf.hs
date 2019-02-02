import Data.Typeable

main :: IO ()
main = do
  let s1 = "string"
      s2 = ["s","t","r","i","n","g"]
      l1 :: [Int]
      l1 = [1,2,3]
  print $ typeOf s1
  print $ typeOf s2
  print $ typeOf l1

