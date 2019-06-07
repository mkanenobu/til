(define hello
  (lambda (name)
    (string-append "Hello " name "!\n")))

(display (hello "World"))
(display (hello "peaples"))

(define sum3
  (lambda (a b c)
    (+ a b c)))

(display (sum3 1 2 3))
(newline)

; lambda定義の省略形
(define (hello name)
  (string-append "Hello " name "!\n"))

(display (hello "sum"))
