(define hello
  (lambda (name)
    (string-append "Hello " name "!")))

(print (hello "World"))
(print (hello "peaples"))

(define sum3
  (lambda (a b c)
    (+ a b c)))

(print (sum3 1 2 3))

; lambda定義の省略形
(define (hello name)
  (string-append "Hello " name "!"))

(print (hello "sum"))

(define (hoge) "HOGE") ; no argument
(print (hoge))