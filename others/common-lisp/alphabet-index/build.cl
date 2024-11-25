#!/usr/bin/env sbcl --script

; sbclでexecutable binaryを作成するスクリプト

(defparameter *load-path* "main.cl")
(defparameter *outfile* "a.out")
(defparameter *function-name* 'main)

(load *load-path*)
(save-lisp-and-die *outfile* :toplevel *function-name* :executable t)
