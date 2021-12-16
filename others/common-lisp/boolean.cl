; t (true)
(print t)
; nil (false)
(print nil)

(print (< 1 2)) ; => t
(print (< 2 1)) ; => nil

(print (and t t)) ; => t
(print (and t t t)) ; => t
(print (and t nil)) ; => nil
(print (or t nil)) ; => t
(print (or nil nil)) ; => nil
(print (or nil t nil)) ; => t
(print (not nil)) ; => t
(print (not 123)) ; => nil