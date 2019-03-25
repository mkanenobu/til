main :: IO ()
main = do
  let lostNumbers = [4,8,15,16,23,42]
  print lostNumbers

  -- String is alias of [Char]
  print $ ['h','e','l','l','o'] ++ " " ++ ['w','o','r','l','d']

  -- ':' is cons operater
  print $ 'A' : " small cat"
  print $ 5 : [1,2,3,4]
  print $ (:) 1 [2,3]
  -- [1,2,3] is syntacs sugar for 1:2:3:[]

  -- index
  print $ "Steve Biscemi" !! 6

  -- list compare
  -- At first, compare first element, if they are equal then compare second element
  print $ [3,2,1] > [2,3,0]
  print $ [3,2,1] > [2,3,0]
  print $ [3,2,1] > [3,2]
  print $ [3,4,2] > [3,4,5] -- false
  print $ [3,4,2] == [3,4,2]

  -- list functions
  print $ head [1,2,3,4,5] -- 1
  print $ tail [1,2,3,4,5] -- [2,3,4,5]
  print $ last [1,2,3,4,5] -- 5
  print $ init [1,2,3,4,5] -- [1,2,3,4]
  -- print $ head [] -- exception
  print $ length [1,2,3,4,5]
  print $ null [1,2,3]
  print $ null []
  print $ reverse [1,2,3]

  -- 'take' takes number of elements as a list from beginning of the list
  print $ take 3 [5,4,3,2,1] -- [5,4,3]
  print $ take 1 [3,9,4] -- [3]
  print $ take 5 [3,9,4] -- [3,9,4]
  print $ take 0 [3,9,4] -- []

  -- 'drop' is drops number of elements from beginning of a list
  print $ drop 3 [1,2,3,4,5] -- [4,5]
  print $ drop 0 [1,2,3,4,5] -- [1,2,3,4,5]
  print $ drop 100 [1,2,3,4,5] -- []

  -- 'maximum' returns biggest element, 'minimum' returns smallest one
  print $ minimum [1,2,3,4,5]
  print $ maximum [1,2,3,4,5]

  print $ sum [1,2,3,4,5]
  print $ product [1,2,3,4,5]

  -- contains
  print $ 4 `elem` [3,4,5,6]
  print $ 1 `elem` [3,4,5,6]

  -- Texas ranges
  print $ ['a'..'z']
  print $ [1..20]
  print $ [2, 4..20] -- +2 step
  print $ [1, 4..20] -- +3 step
  print $ [10..1] -- [], not [10,9,8,7,6,5,4,3,2,1]
  print $ [10, 9..1]
  print [0.1, 0.3 .. 1] -- Floating point number is not precise

  -- first 24 multiples of 13
  print [13, 26..24*13]
  print $ take 24 [13, 26..] -- Better
