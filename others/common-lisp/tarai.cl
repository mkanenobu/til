(defun tarai (x y z)
  (if (<= x y)
      y
    (tarai (tarai (1- x) y z) (tarai (1- y) z x) (tarai (1- z) x y))))

(format t "~A" (tarai 12 6 0))
