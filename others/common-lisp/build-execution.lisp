#!/usr/bin/env sbcl --script

; sbclでexecutable binaryを作成するスクリプト

(defparameter *args* (cdr *posix-argv*))
(defparameter *help* "Usage: build-executable.cl <input-file> <outfile>")

(if (= (length *args*) 0)
  (progn
    (format t "~A~%" *help*)
    (sb-ext:exit)))

(defparameter *load-path* (car *args*))
(defparameter *outfile* (or (caddr *args*) "a.out"))

(defparameter *function-name* 'main)

(load *load-path*)
(save-lisp-and-die *outfile* :toplevel *function-name* :executable t)

