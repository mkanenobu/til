main = do
  print (fizzbuzz 100)

conv :: Int -> String
conv x =
  if x `mod` 15 == 0 then "Fizzbuzz"
  else if x `mod` 5 == 0 then "Buzz"
  else if x `mod` 3 == 0 then "Fizz"
  else show x

fizzbuzz :: Int -> [String]
fizzbuzz n =
  map conv [1..n]
