{-
Reverese Polish Notation calculator implementation in Haskell
-}

import System.IO
import Data.IORef
import Control.Monad

main :: IO ()
main = do
  print (push 1.0 []::Stack)
  readLine stdin >>= print


type Stack = [Float]

push :: Float -> Stack -> Stack
push a xs = (a : xs)

pop :: Stack -> (Float, Stack)
pop [] = error "Stack underflow"
pop (x:xs) = (x, xs)

readLine :: Handle -> IO [String]
readLine h = do
  line <- hGetLine h
  return $ words line

