;; (1 2 3) vector
(format t "~A~%" #(1 2 3))
(format t "~A~%" (type-of #(1 0 1)))

(defun list-to-bit-vector (my-list)
  (make-array (length my-list) :initial-contents my-list :element-type 'bit))

(format t "~A~%" (list-to-bit-vector '(0 0 1)))
