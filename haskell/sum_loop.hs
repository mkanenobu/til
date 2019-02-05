import Control.Monad

main :: IO ()
main = do
  forM_ [0..] $ \_ -> do
    s <- readLineSplit
    print $ sum $ cast <$> s

cast :: String -> Double
cast n = read n::Double

readLineSplit :: IO [String]
readLineSplit =
  words <$> getLine

