main :: IO ()
main = do
  let ls = [1..4]
  print ls
  let ls2 = [1, 3..8]
  print ls2
  let ls3 = [1,4,5,7,9]
  print ls3
  let ls4 = ["foo", "bar", "baz"]
  print ls4
  print (ls4 !! 1) -- index

