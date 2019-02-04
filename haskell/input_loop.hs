import Control.Monad

main :: IO ()
main =
  forM_ [0..] $ \_ ->
    getLine >>= print

