(display (string? "123"))
(newline)
;; 長さnの文字cからなる文字列
(display (make-string 10 #\1))
(newline)

;; n文字目の文字を取得
(display (string-ref "123456" 3))
(newline)

(display (string-append "321" "123"))
(newline)

(display (string->list "1234567"))
(newline)
