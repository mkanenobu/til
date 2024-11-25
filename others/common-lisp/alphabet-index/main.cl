(defun string-to-chars (str)
  (coerce str 'list))

(defparameter *alphabets* "abcdefghijklmnopqrstuvwxyz")
(defun alphabet-index (char)
  (position (char-downcase char) *alphabets*))

(defun flatten (list)
  (apply #'append list))

(defun main ()
  (let ((chars (flatten (mapcar #'string-to-chars (cdr *posix-argv*)))))
    (dolist (char chars)
      (format t "~A: ~D~%" char (alphabet-index char)))))
