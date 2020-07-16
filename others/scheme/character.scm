;; character
(display #\c)
(display #\tab)
(display #\space)
(display #\linefeed)
(display #\return)

(display (char->integer #\A))
(newline)
(display (integer->char 66))
(newline)

;; 文字を整数になおして比較
;; a < b == #t
(display (char<? #\a #\b))
(newline)
;; これと等価
(display (< (char->integer #\a) (char->integer #\b)))