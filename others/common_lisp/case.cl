(defvar val 3)
(defvar val2
      (case val (1 "One")
                (2 "Two")
                (3 "Three")
                ;; else
                (t "Other")))


(format t "~A~%" val2)

