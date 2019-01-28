-- doは副作用があることを明示
nl = putStrLn ""
main = do
  print (sampleFunc 1)
  print (sampleFunc 13)
  nl
  print (add (1, 1) (2, 3))
  nl
  print (ufo_operater 1 2)
  print (ufo_operater 3 3)
  print (5 `ufo_operater` 1)

-- sampleFuncが引数にInt型の値を取り、String型を返すという宣言
sampleFunc :: Int -> String
sampleFunc 1 = "n is 1"
sampleFunc 2 = "n is 2"
sampleFunc n = "n is " ++ (show n)


add :: (Int, Int) -> (Int, Int) -> (Int, Int)
add (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

-- ガード
-- 式
--  | 条件1 = 条件1にマッチした時の処理
--  | 条件2 = 条件2にマッチした時の処理
--  | otherwise = いずれの条件にもマッチしなかった場合の処理
ufo_operater :: (Ord a) => a -> a -> Ordering
a `ufo_operater` b
  | a == b = EQ
  | a <= b = LT
  | otherwise = GT
