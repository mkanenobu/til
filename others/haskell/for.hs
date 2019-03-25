import Control.Monad
import Data.IORef

main :: IO ()
main = do
  print "For"
  printList [1..5]
  print "Sum"
  s <- getSum [6..10]
  print s

printList :: [Int] -> IO ()
printList ls = do
  forM_ ls $ \i -> do
    print i

getSum :: [Int] -> IO Int
getSum ls = do
  s <- newIORef 0
  forM_ ls $ \i -> do
    c <- readIORef s
    writeIORef s (c + i)
  res <- readIORef s
  return res
