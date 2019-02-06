{-
Reverese Polish calculator implementation in Haskell
-}
import System.IO
import Control.Monad
import Control.Applicative

type Stack = [Double]

operaters :: [String]
operaters = ["+", "-", "*", "/"]

main :: IO ()
main = do
  line <- readLine
  forM_ [0..(length line - 1)] $ \i -> do
    let n = line !! i
    let s = []
    -- print $ strToDbl $ n
    print $ calOrPush n s

strToDbl :: String -> Double
strToDbl n = read n::Double

push :: Double -> Stack -> Stack
push a xs = a : xs

pop :: Stack -> (Double, Stack)
pop [] = error "Stack underflow"
pop (x : xs) = (x, xs)

calOrPush :: String -> Stack -> Stack
calOrPush str s =
  if str `elem` operaters
     then calc str s
     else push (strToDbl str) s

readLine :: IO [String]
readLine =
  words <$> getLine

calc :: String -> Stack -> Stack
calc w s =
  case w of
    "+" -> (push (n1 + n2) s2)
    "-" -> (push (n1 - n2) s2)
    "*" -> (push (n1 - n2) s2)
    "/" -> (push (n2 / n1) s2)
    _   -> error "Calicurating error"
    where
      n1 = fst $ pop s
      s1 = snd $ pop s
      n2 = fst $ pop s1
      s2 = snd $ pop s1

