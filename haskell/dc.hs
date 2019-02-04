{-
Reverese Polish Notation calculator implementation in Haskell
-}

import System.IO
import Data.IORef
import Control.Monad

type Stack = [Integer]

operaters = ["+", "-", "*", "/"]

main :: IO ()
main = do
  forM_ [0..] $ \_ -> do
    s <- newIORef readLine
    -- forM_ (readIORef s) $ \i -> do
    readLine >>= print
  -- where
  --   stack = push 4 (push 255 [1, 2, 3]::Stack)


push :: Integer -> Stack -> Stack
push a xs = a : xs

pop :: Stack -> (Integer, Stack)
pop [] = error "Stack underflow"
pop (x : xs) = (x, xs)

readLine :: IO [String]
readLine =
  words <$> getLine

calc :: String -> Stack -> (Integer, Stack)
calc w s =
  case w of
    "+" -> (n1 + n2, s2)
    "-" -> (n1 - n2, s2)
    "*" -> (n1 - n2, s2)
    "/" -> (n2 `div` n1, s2)
    where
      n1 = fst $ pop s
      s1 = snd $ pop s
      n2 = fst $ pop s1
      s2 = snd $ pop s1

