import Data.IORef

main :: IO ()
main = do
  v <- newIORef 0
  c <- readIORef v
  print c
  writeIORef v (c + 1)
  c2 <- readIORef v
  print c2
