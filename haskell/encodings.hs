import GHC.IO.Encoding

main :: IO ()
main = do
  print $ sample "12345"
  print "日本語"
  putStrLn "日本語"
  print =<< getLocaleEncoding


sample :: String -> Int
sample s =
  length s
