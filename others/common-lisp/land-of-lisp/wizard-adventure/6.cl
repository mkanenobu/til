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
; 注）SBCLだとprintがバッファリングらしく何も表示されずに入力待ちになって入力後に一気に表示される（REPLでもスクリプト実行でも同じ）
; またreadは入力を文字列としてではなく式として受け取るっぽい
(defun say-hello ()
  (print "Please type your name:")
  ; flush
  (force-output)
  (let ((name (read)))
    ; (print (type-of name))
    (print "Nice to meet you, ")
    (prin1 name)))

(say-hello)
