{-
Reverese Polish Notation calculator implementation in Haskell
-}
import System.IO
import Data.IORef
import Control.Monad

type Stack = [Double]

operaters = ["+", "-", "*", "/"]

main :: IO ()
main = do
  forM_ [0..] $ \_ -> do
    s <- readLine
    -- forM_ (readIORef s) $ \i -> do
    print $ sum $ map cast s
  -- where
  --   stack = push 4 (push 255 [1, 2, 3]::Stack)

cast :: String -> Double
cast n = read n::Double

push :: Double -> Stack -> Stack
push a xs = a : xs

pop :: Stack -> (Double, Stack)
pop [] = error "Stack underflow"
pop (x : xs) = (x, xs)

readLine :: IO [String]
readLine =
  words <$> getLine

calc :: String -> Stack -> (Double, Stack)
calc w s =
  case w of
    "+" -> (n1 + n2, s2)
    "-" -> (n1 - n2, s2)
    "*" -> (n1 - n2, s2)
    "/" -> (n2 / n1, s2)
    where
      n1 = fst $ pop s
      s1 = snd $ pop s
      n2 = fst $ pop s1
      s2 = snd $ pop s1

