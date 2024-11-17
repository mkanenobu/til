; 6 IO: Lispでのデータの読み書き

; これまでの章では外の世界とやりとりするコードは一切書いていなかった
; ただいつまでもREPLなどで動かすわけにはいかないので何らかのインターフェースを作る必要がある
; 先の章では実際にウェブインターフェースを作るが、この章では最も基本的なコマンドラインインターフェースを実装する

; 6.1 テキストの表示と読み込み

; print関数は渡したものをコンソールに表示し、同時に渡されたものを関数の評価値としても返す
(print "foo")
(progn (print "this")
       (print "is")
       (print "a")
       (print "test")) ; 1行づつ表示される

; printは値を表示する簡単な方法だがprin1を好むLisperも多い
; prin1はprintのように改行しないのでこちらの方がより基本的な関数と言える
(progn (prin1 "this")
       (prin1 "is")
       (prin1 "a")
       (prin1 "test")) ; 一行で "this""is""a""test" のように表示される

; 入力プロンプト

; この関数はユーザーに入力を促して挨拶を返す
; 注）SBCLだとprintがバッファリングらしく何も表示されずに入力待ちになって入力後に一気に表示される（REPLでもスクリプト実行でも同じ）、そのためforce-outputを使ってフラッシュする
; またreadは入力を文字列としてではなく式として受け取る（完全にLispのコードとして評価する訳ではない）
; 文字列として受け取る場合にはread-lineを使う
(defun say-hello ()
  (print "Please type your name:")
  ; flush
  (force-output)
  (let ((name (read)))
    ; (print (type-of name))
    (print "Nice to meet you, ")
    (prin1 name)))

; (say-hello)

; printとreadはLispのほとんどの型情報を保持して読み書き出来る
; 例）文字列としてprintするとダブルクォートで囲まれた文字列が表示される、readにダブルクォートで囲まれた文字列を渡すと文字列として読み込まれる

; 数値として受け取る例
(defun add-five ()
  (print "Please enter a number:")
  (force-output)
  (let ((num (read)))
    (print "I add five I get")
    (print (+ num 5))))

; (add-five)

; 特殊文字
; printだとそのまま出る
(print #\newline)
(print #\tab)
(print #\space)

; 通常ではシンボルはcase in-sensitiveだが、||で囲むことでcase sensitiveなシンボルを作ることも出来る
(print '|abc|)
(princ '|Abc|)
(print (eq '|ABC| '|abc|)) ; NIL
(print (eq '|ABC| '|ABC|)) ; T
; 通常の方はcase in-sensitiveというより常に大文字として扱われるような挙動をする
(print (eq '|ABC| 'abc)) ; T
(print (eq '|abc| 'ABC)) ; NIL
; ||で囲めば記号も使える
(print '|Hello, World!|)

; princはエスケープなしで人間に読みやすい形で出力する
(progn (princ "This sentence will be interrupted")
       (princ #\newline)
       (princ "by a annoying newline character.")
       (princ #\newline))

; 余計なクォートなどを除いたsay-helloの改良版
(defun say-hello2 ()
  (princ "Please type youe name: ")
  (force-output)
  (let ((name (read-line)))
    (princ "Nice to meet you, ")
    (princ name)))

; (say-hello2)
