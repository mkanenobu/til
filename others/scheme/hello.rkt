#lang racket
; Hello world as a variable
(define vhello "Hello world\n")
; Hello world as a function
(define fhello (lambda () "Hello world"))

(print vhello)
(display (fhello))
