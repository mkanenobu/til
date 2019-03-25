main :: IO ()
main = do
  print $ even n_even
  print $ even n_odd
  print $ odd n_even
  print $ odd n_odd
    where
      n_even = 2::Integer
      n_odd = 3::Integer
