main :: IO ()
main = do
  cs <- getContents
  print $ unlines ["Hello", "World"]
  print $ lines "Hello\nWorld"
  -- 標準入力の上から2行を出力
  putStr $ firstNLines 2 cs

firstNLines :: Int -> String -> String
-- unlines: [Char]リストを連結して文字列にする
-- lines: Stringを改行で分割して[Char]にする
-- take: リストの先頭からn個の要素を取ってリストで返す
firstNLines n cs =
  unlines $ take n $ lines cs

