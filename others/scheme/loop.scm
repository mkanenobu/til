(define n
  (do ((i 0 (+ i 3))) ;; 変数 初期値 ステップ
    ((> i 10) i) ;; 停止条件 停止条件が#tのとき評価され、do式全体の戻り値になる
    (print i))) ;; 停止条件が#fのときに評価される

(print (string-append "last i is " (number->string n)))