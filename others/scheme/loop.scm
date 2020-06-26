(do ((i 0 (+ i 1))
     (j 0 (+ i j)))
    ((= i 10) j)
  (print j))