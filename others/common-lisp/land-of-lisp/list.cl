; 3.4

; Lispは基本的に全てがリストで構成されている
; リストはコンスセルという構造になっている（いわゆるリンクドリスト）

; リストを扱う関数
; 上述の通り、Lispはリストで構成されているためリストを扱うことが非常に重要
; コンスセルを扱う最も基本的な関数が3つある（cons, car, cdr）

; cons
; consは二つのデータを結びつけたい時に使う
; 二つのデータをとって、それを結びつけたコンスセルを返す
(cons 'chiken 'cat) ; (CHIKEN . CAT) ; .はこれが通常のリストではなくコンスセルであることを示す
; 右側にnilを渡すと表示されない、これはLispではnilがリストの終端を表すため
; データの表記としては (CHIKEN . NIL) でも間違いではない
(cons 'chiken 'nil) ; (CHIKEN)
; 空のリストとnilシンボルは同じ意味
(cons 'chiken ()) ; (CHIKEN)

; beefとchikenのリストにporkをコンスする
(cons 'pork '(beef chiken)) ; (PORK BEEF CHIKEN)
; ↑と同じ
(cons 'pork (cons 'beef (cons 'chicken ())))

; car, cdr

; carはコンスセルの最初のスロットの値を取り出すのに使う
(car '(chiken beef pork)) ; CHIKEN
; cdrはコンスセルの2番目のスロットの値を取り出すのに使う（リストの2番目以降を返すとも言える）
(cdr '(chiken beef pork)) ; (BEEF PORK)

; carとcdrを繋げたcadr, cdar, cadadrなどもあり、複雑なアクセスに有用
(car (cdr '(pork beef chicken))) ; BEEF
; ↑と同じ
(cadr '(pork beef chicken)) ; BEEF
; cadrの一つcdrが多い版
(caddr '(pork beef chicken)) ; CHICKEN
; さらにもう一つ多い版
(cadddr '(pork beef chicken)) ; NIL

; リストの表記はいくつかある
; 下記はどれも同じデータ構造

; consの連続
(cons 'pork (cons 'beef (cons 'chicken ())))
; list関数
(list 'pork 'beef 'chicken)
; データモード
'(pork beef chicken)

; ネストしたリスト
(defparameter *my-list* '(cat (duck bat) ant))
; どんなに複雑にネストしたリストでもコンスセルで出来ていることには変わりないので同様に取得可能
(car (cdr (cdr *my-list*))) ; ANT
(cdr (car (cdr *my-list*))) ; (BAT)
(car (car (cdr *my-list*))) ; DUCK
