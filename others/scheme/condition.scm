(define n1 10)
(define n2 100)

(if (< n1 n2)
  (display "n1 smaller than n2")
  (display "n2 bigger than n2"))

(newline)

(define count
  (lambda (num)
    (cond
      ((= 1 num) "n = 1")
      ((= 2 num) "n = 2")
      ((= 3 num) "n = 3")
      (else "bigger than 3"))))

(write (count 3))
(write (count 10))

(newline)

(define res
  (case (* 2 3)
  ((1 2 3) "1 or 2 or 3")
  ((4 5 6) "4 or 5 or 6")
  (else "other")))

(display res)