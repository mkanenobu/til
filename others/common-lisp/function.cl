
(defun square
    (n) ; args
    (* n n))

(defun p
    (s)
    (print s))

(defun is-a-greater-than-b
    (a b)
    (> a b))

(defun optional-arg
    (&optional x)
    (not x))

; default argument
(defun default-arg
    (n &optional (x 10))
    (+ n x))

(print (square 3))
(p "Hello")
(print (is-a-greater-than-b 4 2)) ; => t
(print (optional-arg)) ; => t
(print (optional-arg 1)) ; => nil
(print (default-arg 3)) ; => 13
(print (default-arg 4 3)) ; => 7