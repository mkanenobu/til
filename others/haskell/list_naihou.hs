nl = putStrLn ""
main = do
  -- [map-function x | x <- xs, filter]

  -- 0から100までの奇数
  let l1 = [x | x <- [0..100], x `mod` 2 == 1]
  print l1
  nl

  -- 0から100までの2乗、3で割り切れるもの
  let l2 = [x * x | x <- [0..100], x `mod` 3 == 0]
  print l2
