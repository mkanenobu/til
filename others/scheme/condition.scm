(define n1 10)
(define n2 100)

(if (< n1 n2)
  (print "n1 is smaller than n2")
  (print "n1 is bigger than n2"))

(newline)

(define count
  (lambda (num)
    (cond
      ((= 1 num) "n = 1")
      ((= 2 num) "n = 2")
      ((= 3 num) "n = 3")
      ((>= 0 num) "n <= 0")
      (else "bigger than 3"))))

(print (count 3))
(print (count -10))
(print (count 10))

(newline)

(define res
  (case (* 2 3)
  ((1 2 3) "1 or 2 or 3")
  ((4 5 6) "4 or 5 or 6")
  (else "other")))

(print res)