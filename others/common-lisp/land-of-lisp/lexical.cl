; ローカル夋数・関数の定義方法
; `sbcl --script lexical.cl` のような感じで実行可能（REPLに読み込んでも同じ結果が得られる）

; レキシカルスコープ（ローカル変数）の変数定義
; aとbを定義して、それらを足して表示する
(let ((a 5)
      (b 1))
  (print (+ a b)))

; ローカル関数の定義
; add-twoというローカル関数を定義して利用
(flet ((add-two (n)
       (+ n 2)))
  (print (add-two 3)))