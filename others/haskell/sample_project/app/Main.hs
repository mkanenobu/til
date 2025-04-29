module Main where

import Control.Monad (unless)
import System.IO (hFlush, stdout)
import qualified System.Random as R
import Text.Read (readMaybe)
import System.Exit (exitSuccess)

main :: IO ()
main = do
    putStrLn "Guess the number."
    n <- randomNumber
    repl $ eval n
  where
    eval n input = do
        if input == n
            then do
              putStrLn "Correct!"
              exitSuccess
            else
                if input < n
                    then putStrLn "Too low!"
                    else putStrLn "Too high!"

repl :: (Int -> IO ()) -> IO ()
repl evaluator = do
    loop
  where
    loop = do
        putStr "> "
        hFlush stdout
        line <- getLine
        unless (line == ":quit") $ do
            putStrLn $ "Input: " ++ line
            hFlush stdout
            case parseInt line of
                Nothing -> putStrLn "Invalid input. Please enter a number."
                Just n -> evaluator n

            loop

randomNumber :: IO Int
randomNumber = do
    rg <- R.getStdGen
    let (n, _) = R.randomR (1, 100) rg
    return n

parseInt :: String -> Maybe Int
parseInt = readMaybe
