; #lang racket
;; Print the Greek alphabet
(for ([i (in-range 26)])
  (display
   (integer->char
    (+ i (char->integer #\a)))))
