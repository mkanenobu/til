import Data.IORef

main = do
  a <- newIORef 1
  writeIORef a 2  -- 破壊的代入
  print =<< readIORef a
