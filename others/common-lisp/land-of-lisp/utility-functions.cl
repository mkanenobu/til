; よく使いそうな関数の備忘録

; carはリストの先頭の要素を返す
(print (car '(a b c))) ; A
; cdrはリストの2つめ以降の要素を返す
(print (cdr '(a b c))) ; (B C)
; carとcdrを組み合わせるとリストの任意の場所の要素を取り出すことが出来る
(print (car (cdr '(a b c)))) ; B
(print (car (cdr (cdr '(a b c))))) ; C
; carとcdrの組み合わせはいくつかのショートハンドがある
(print (cadr '(a b c))) ; (car (cdr '(a b c))) -> B
(print (cdar '((a b) c))) ; (cdr (car '((a b) c))) -> (B)
(print (cadar '((a b) c))) ; (car (cdr (car '((a b) c)))) -> B

; assocは連想リスト（alist）の要素を探索して指定された要素が含まれる連想リストの要素を返す
(let ((l '((a 1) (b 2) (c 3))))
  (print (assoc 'b l))) ; (B 2)

; memberはリストを探索して指定した要素と最初に一致した要素以降の部分リストを返す
(print (member 'b '(a b c))) ; (B C)

; appendは複数のリストを取って、それらを繋げたリストを返す
(print (append '(a b) '(c d))) ; (A B C D)

; applyは関数とリストを取って、リストをバラして関数に渡した結果を返す
(print (apply #'+ '(2 3 4))) ; -> (+ 2 3 4) -> 9

; applyとappendを組み合わせるとリストをflattenすることが出来る
(print (apply #'append '((a b) (c d) (e f)))) ; (A B C D E F)

; mapcarはリストのそれぞれの要素に関数を適用した結果をリストで返す（いわゆるmap）
(print (mapcar #'1+ '(1 2 3))) ; (2 3 4)
; mapcarは複数のリストを取れる
(print (mapcar #'+ '(1 2 3) '(4 5 6))) ; (5 7 9)

; remove-if-notはリストの要素をフィルタリングする
(let ((l '(1 2 3 4 5)))
  ; 奇数ではない要素を取り除く
  (print (remove-if-not #'oddp l))) ; (1 3 5)

; findはリストを探索して指定した要素と同じを見つけたらその要素（のみ）を、見つからない場合にはnilを返す
(print (find 'b '(a b c))) ; B
; キーワード引数 :key でリストの各要素に適用する関数を指定出来る
(print (find 'c '((a b) (c d) (e f)) :key #'car)) ; (C D)
(print (find 'b '((a b) (c d) (e f)) :key #'cadr)) ; (A B)

; pushはリスト変数の最初に要素を追加する
; pushコマンドはsetfコマンドを作って作られた関数で (setf *l* (cons 7 *l*)) と呼び出すのと同じ
(defparameter *l* '(1 2 3))
(print *l*) ; (1 2 3)
(push 7 *l*)
(print *l*) ; (7 1 2 3)

; concatenateは結果の型を指定して複数のリストを連結する
(print (concatenate 'string "Hello, " "World!"))
(print (concatenate 'list '(1 2) '(3 4) '(5 6)))

; coerceは型変換を行う
(print (coerce "ABC" 'list)) ; (#\A #\B #\C) ; string -> listの場合は文字のリストになる
(print (coerce '(#\A #\B #\C) 'string)) ; "ABC" ; 文字のリスト -> stringの場合は繋げた文字列になる
