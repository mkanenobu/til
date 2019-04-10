; ラムダ式
(lambda (n)(+ n 1))
(display ((lambda (n)(+ n 1)) 3))

; ラムダ式を変数"plus-one"にバインド
(define plus-one (lambda (n)(+ n 1)))
(display (plus-one 12))
