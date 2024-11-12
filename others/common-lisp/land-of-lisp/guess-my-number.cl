; 二分探索を行うやつ
; (load "guess-my-number.cl") としてREPLに読み込んで(bigger), (smaller)で遊べる

; スペシャル変数（いわゆるグローバル変数）の定義
; **はただの変数名の一部でスペシャル変数にはこれを付ける慣習がある
; スペシャル変数の定義にはdefvarを使う方法もあるが、そちらは再定義不可能（エラーにはならない）、あくまで変数なので値の変更は可能
; devconstantというのもあり、そちらは定数を定義でき、再定義不可能で値の変更も不可能（エラーになる）
(defparameter *small* 1)
(defparameter *big* 100)

(defun guess-my-number ()
  ; ash関数は、第一引数の値を第二引数ビットだけシフトする
  (ash (+ *small* *big*) -1))

(defun smaller ()
  ; 上限を下げる
  (setf *big* (1- (guess-my-number)))
  (guess-my-number))

(defun bigger ()
  ; 下限を上げる
  (setf *small* (1+ (guess-my-number)))
  (guess-my-number))

; リセット
(defun start-over ()
  ; defparameterは再定義可能
  (defparameter *small* 1)
  (defparameter *big* 100)
  (guess-my-number))
