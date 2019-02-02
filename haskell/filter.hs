filter' :: (a->Bool) -> [a] -> [a]
filter' _ [] = []
filter' p (x:xs)
  | p x       = x : filter' p xs
  | otherwise = filter' p xs

main :: IO ()
main = do
  let l = [0..10]
  print $ filter' even l
