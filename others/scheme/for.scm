;; Print the Greek alphabet
(for ([i (in-range 0 26 1)])
  (display
   (integer->char
    (+ i (char->integer #\a)))))
