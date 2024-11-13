; ローカル夋数・関数の定義方法
; `sbcl --script lexical.cl` のような感じで実行可能（REPLに読み込んでも同じ結果が得られる）

; レキシカルスコープ（ローカル変数）の変数定義
; aとbを定義して、それらを足して表示する
(let ((a 5)
      (b 1))
  (print (+ a b)))

; ローカル関数の定義
; flatの中でローカル関数を定義・利用出来る
; add-twoというローカル関数を定義して利用
(flet ((add-two (n)
       (+ n 2)))
  (print (add-two 3)))

; 複数の関数を定義可能
(flet ((add-ten (n)
       (+ n 10))
       (minus-five (n)
       (- n 5)))
  (print (minus-five (add-ten 3))))

; ローカル関数の中で同じスコープのローカル関数を使いたいときにはlabelsを使う
(labels ((a (n)
           (+ n 1))
         ; 関数bの中で関数aを利用、fletだとbがaを知らないことになるので利用できない
         ; labelsを使えば自分自身を再帰的に呼び出すことも可能
         (b (n)
           (+ 5 (a n))))
        (print (b 10)))
