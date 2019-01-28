nl = do putStrLn ""

main = do
  -- Bool
  print (True && True)
  print (False || True)
  print (not True)
  nl

  -- Int, Integer
  -- Intはマシンのプリミティブに表現できる大きさまで
  -- Integerは多倍長整数
  -- リテラル::型名とするとリテラルを強制的に特定の型にできます。
  print ((2::Int) ^ 62)
  print ((2::Int) ^ 63) -- 正しく表現できない
  print ((2::Integer) ^ 65)
  nl

  -- Int型は次のクラスのインスタンスになっている
  -- Bounded, Enum, Eq, Integral, Num, Ord, Read, Real, Show

  -- IntegerはInt型のクラスのうちBoundedクラス以外のインスタンスになっている
  -- Boundedクラスは値の上限及び下限を表す関数を宣言している。Integer型に上限及び下限は存在しない
  print (minBound::Int)
  print (maxBound::Int)
  nl

  -- 暗黙の型変換は存在しないので明示的に変換する必要がある
  -- print ((2::Int) + (3::Integer)) Error

  -- Int型とInteger型はtoInteger関数かfromIntegral関数でそろえる
  -- Intの範囲で十分か不明な場合はIntをIntegerに変換する
  -- 下記例の前者はIntで表現不可能な値をInt型に変換しているため値が壊れている。エラーは出ない
  print ((2::Int) + fromIntegral ((3::Integer) ^ 63))
  print (fromIntegral (2::Int) + ((3::Integer) ^ 63))
  nl

  -- fromIntegral関数はIntegralクラスのインスタンスである型(Int, Integer)を引数に取り、Numクラスのインスタンスに変換する
  -- fromIntegral :: (Integral a, num b) => a => b
    -- Defined in GHC.Real


  -- 実数
  -- Float型とDouble型がありどちらも次のクラスのインスタンスである。
  -- Enum, Eq, Floating, Fractional, Num, Ord, Read, Real, RealFloat, RealFrac, Show


  -- 有理数
  -- 有理数を表すRational型もある、まずData.Ratioモジュールを導入する
  -- import Data.Ratio

  -- Numクラス
  -- 基本になるNum

  -- タプル
