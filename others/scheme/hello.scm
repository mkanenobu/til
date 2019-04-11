; Hello world as a variable
(define vhello "Hello world\n")
; Hello world as a function
(define fhello (lambda () "Hello world"))

(display "Hello world\n")
(display vhello)
(display (fhello))
