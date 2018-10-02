; コンスセルとはアドレスを2つ収納したメモリー領域のこと
; 1つ目が入っている方をcar部，2つ目が入っている方をcdr部と呼びます
(cons 1 2)
; コンスセルは数珠つなぎにできる
(cons 3 (cons 1 2))
(cons #\a (cons 3 "hello"))
; 入れ子にすることもできる
(cons (cons 0 1 ) (cons 2 3))
; 一番最後のコンスセルのcdr部が'()になった一連のコンスセルをリストと呼ぶ
; '()は空リストと呼ばれる。コンスセルが一つでもそのcdrが'()ならリストである
(cons "hi" "everyone") ; -> ("hi" . "everyone")
(cons 0 '()) ; -> (0)
(cons 1 (cons 10 100 )) ; -> (1 10 . 100)
(cons 1 (cons 10 (cons 100 '()))) ; -> (1 10 100)
(cons #\I (cons "saw" (cons 3 (cons "girls" '()))))
; -> (#\I "saw" 3 "girls")
(cons "Sum of" (cons (cons 1 (cons 2 (cons 3 (cons 4 '())))) (cons "is" (cons 10 '()))))
; -> ("Sum of" (1 2 3 4) "is" 10)
