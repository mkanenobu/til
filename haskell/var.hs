import Data.IORef

-- グローバル変数(top-level)
g :: Integer
g = 100

main :: IO ()
main = do
  print g
  -- 再代入可能な変数の作成(変数aを0で初期化)
  a <- newIORef 0
  b <- readIORef a
  print b
  writeIORef a (b + 1)
  c <- readIORef a
  print c

  -- letで定義
  let d = 30
      e = 40
  print d
  print e

  -- 末尾のwhereで定義
  print f
    where
      f = 10

