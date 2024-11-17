; 6.3 ゲームエンジンに専用のインターフェースを追加する

; LispでREPLを作るのは非常に簡単
(defun simple-repl ()
  ; loopは無限ループするだけ、他は今まで出てきたコマンド
  ; 注）やはりSBCLだと出力がバッファリングされるので意図したタイミングで表示されない
  (loop (print (eval (read)))))

; (simple-repl)

; これではLispのREPLのままなので使いやすいように置き換えていく
; - Lispの構文ではなく単純にlookなどのコマンドをそのまま入力出来るようにする
; - 引数についてもクォートなしで入力出来るようにする
(defun game-read ()
  ; read-from-stringはreadと同じようにデータを読み込むが標準入力ではなく文字列から読み込む
  (let ((cmd (read-from-string
              ; concatenateは文字列を連結する
              ; 先頭に"("、最後に")"を追加してリストの表記にしてread-from-stringに渡す
              (concatenate 'string "(" (read-line) ")"))))
    ; クォートする関数
    ; 実はシングルクォートはquoteコマンドのシンタックスシュガーで 'foo と書くのは (quote foo) と書くのと同じ
    ; そのためquoteから始まるリストに入れることでクォート出来る
    ; 注）コードではなくデータになるだけなので (quote x) というコード（を評価した 'x）ではなく '(quote x) というリストデータになるだけなのでは？と思うがよく分からない
    (flet ((quote-it (x)
            (list 'quote x)))
      (cons (car cmd) (mapcar #'quote-it (cdr cmd))))))

; (let ((r (game-read)))
;   (print r))
; この関数は入力によっては例外が発生する可能性があるが、例外処理は後の章で扱う

; game-eval関数を追加
; evalコマンドを直接使うとゲームに関係ないLispコマンドも受け付けてしまうという問題がある
; game-evalコマンドはあらかじめ決められたコマンドだけを呼べるようにしておく
(defparameter *allowd-commands* '(look walk pickup inventory))
; 引数はgame-read関数の結果を受け取ることを想定している
(defun game-eval (sexp)
  ; 許可されたコマンドのリストの中にあるかどうかを確認してからevalする
  (if (member (car sexp) *allowd-commands*)
      (eval sexp)
      '(i do not known that command.)))

; game-print関数を追加
; 元データがシンボルなので今のままでは全部大文字で表示されてしまう
(defun tweak-text (lst caps lit)
  (when lst
    ; 処理対象の文字（item）と残りの文字列（rest）に分ける
    (let ((item (car lst))
          (rest (cdr lst)))
            ; 文字がスペースなら全てのオプションを引き継いで次の文字に対して再帰的に処理
      (cond ((eql item #\space)
              (cons item (tweak-text rest caps lit)))
            ; 文字が!?.のいずれかなら次の文字に対して大文字にするオプション（caps）を有効に、それ以外のオプションを引き継いで再帰的に処理
            ((member item '(#\! #\? #\.))
              (cons item (tweak-text rest t lit)))
            ; litが有効なら変換を行わずcapsを無効にして次の文字に対して再帰的に処理
            ; これは文字列などを大文字小文字の変換を行わずそのまま表示したい時用のオプションで、現時点では使っていない
            (lit
              (cons item (tweak-text rest nil lit)))
            ; capsが有効なら現在の文字を大文字に変換しつつ、次の文字に対してcapsを無効にして再帰的に処理
            (caps
              (cons (char-upcase item) (tweak-text rest nil lit)))
            ; それ以外の場合は現在の文字を小文字に変換しつつ、次の文字に対して再帰的に処理
            ; 注）litを引き継がない必要は無いが、最初にlitがtだった場合はこの処理に入ることが無いのでどちらでも挙動には関係しない
            (t
              (cons (char-downcase item) (tweak-text rest nil nil)))))))

(defun game-print (lst)
  ; まず (prin1-to-string lst) でシンボルのリストを文字列に変換する、prin1-to-stringはその名前の通りprin1と同じフォーマットで、出力ではなく文字列を返す
  ; 次に (string-trim "() " ...) で文字列の先頭と末尾の余計な文字（()とスペース）を取り除く
  ; 次に (coerce ... 'list) で文字列をリストに変換する、coerceは型変換を行うコマンドだが、文字列をリストに変換する場合は文字のリストになる
  ; 次に tweak-text でリストの文字をいい感じに大文字小文字変換する
  ; 次に (coerce ... 'string) で文字のリストを文字列に変換する
  ; 変換された文字列を (princ ...) で出力する
  (princ (coerce (tweak-text (coerce (string-trim "() " (prin1-to-string lst))
                              'list)
                  t
                  nil)
          'string))
  ; princは改行しないので最後にfresh-lineで改行する
  ; fresh-lineは出力ストリームが先頭ではない場合に改行する（同時に2回以上呼び出しても改行が連続しない）、それが判断出来ない場合は常に改行する
  ; 似たコマンドにterpriがあり、こちらは常に改行する
  (fresh-line))

; (game-print '(there is a whisky. i have got nothing.))

(defun geme-repl ()
  (loop (game-print (game-eval (game-read)))))
