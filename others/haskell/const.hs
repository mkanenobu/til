main = do
  let foo = "string"
      bar = 3.4
      baz = True
  -- 標準入力を読み込む
  c <- getContents
  putStrLn foo
  putStrLn (show bar) -- `show`は文字列以外のものを文字列に変換する関数
  print baz -- `print`はshowをしてから`putStrLn`する関数
  putStrLn c
