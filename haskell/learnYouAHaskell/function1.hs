main :: IO ()
main = do
  print $ doubleMe 3
  print $ doubleUs 4 5
  print $ doubleUs' 4 5

doubleMe x = x + x
doubleUs x y = x * 2 + y * 2
doubleUs' x y = doubleMe x + doubleMe y

doubleSmallerNum x =
  if x > 100
     then x
     else x * 2

-- if statement is an expression
doubleSmallerNum' x =
  (if x > 100 then x else x*2) + 1
