import System.Random

randomAlphabet =
  getStdRandom $ randomR ('A', 'Z')

main = do
  r <- randomAlphabet
  print r
  print =<< randomAlphabet
  randomAlphabet >>= print
