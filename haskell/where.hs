main = do
  print (calBMI 60 170.0)

-- 関数の末尾にwhere、そのあとに変数 = 式とすることで一時変数的なものを作成可能
-- where内でwhere内の別の変数を参照することも可能
-- BMI判定
calBMI :: Double -> Double -> String
calBMI weight height
  | bmi < 18.5 = "Skinny"
  | bmi < 25.0 = "Normal"
  | bmi < 30.0 = "Fat"
  | otherwise  = "So fat"
  where
    bmi    = weight / (heightM * heightM)
    heightM = height / 100
