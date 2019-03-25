main :: IO ()
main = do
  -- 'cycle' takes a list and cycle it into an infinitie list
  print $ take 10 (cycle [1,2,3])
  print $ take 12 (cycle "LOL ")
  -- 'repeat' takes an element and produces an infinitie list
  print $ take 10 (repeat 5)
  print $ replicate 3 10 -- [10,10,10]

  -- list comprehension
  print $ [x*2 | x <- [1..10]]
  print $ [x*2 | x <- [1..10], x*2 >= 12]
  print $ [x | x <- [50..100], x `mod` 7 == 3]
  print $ boomBangs [7..13]
  print $ [ x | x <- [10..20], x /= 13, x /= 15, x /= 19 ]
  print $ [ x*y | x <- [2,5,10], y <- [8,10,11], x * y > 50]
  let nouns = ["hobo","frog","pope"]
  let adjectives = ["lazy","grouchy","scheming"]
  print $ [adjective ++ " " ++ noun | adjective <- adjectives, noun <- nouns]

  print $ removeNonUpperCase "Hello, World" -- "HW"




boomBangs :: [Int] -> [String]
boomBangs xs =
  [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x ]

length' xs = sum [1 | _ <- xs]
removeNonUpperCase st = [ c | c <- st, c `elem` ['A'..'Z']]
