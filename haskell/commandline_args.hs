import System.Environment (getArgs)

main :: IO ()
main = do
  args <- getArgs
  putStrLn $ args !! 0
  putStrLn $ args !! 1

-- runghc $0 a b
  -- a
  -- b
