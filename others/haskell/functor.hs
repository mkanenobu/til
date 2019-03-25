main :: IO ()
main = do
  -- <$> is fmap's infix notation
  -- fmap :: (a -> b) -> f a -> f b
  print $ fmap (* 3) l
  print $ (+ 3) <$> l
    where
      l = [0..5]
