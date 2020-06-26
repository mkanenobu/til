; Hello world as a variable
(define vhello "Hello, world\n")
; Hello world as a function return string
(define fhello (lambda () "Hello, world\n"))

(display "Hello, world\n")
(print "Hello, World")
(display vhello)
(display (fhello))
(write "Hello, World")