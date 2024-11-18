; 6.4 ゲームインターフェースを試してみる

; engine
; 5章で実装された基本的なゲームエンジン部分
(defparameter *nodes* '((living-room (you are in the living-room.
                                      a wizard is snoring loudly on the couch.))
                        (garden (you are in the beautiful garden.
                                 there is a well in front of you.))
                        (attic (you are in the attic.
                                there is a giant welding torch in the corner.))))

(defun describe-location (location nodes)
  (cadr (assoc location nodes)))

(defparameter *edges* '((living-room (garden west door)
                                     (attic upstairs ladder))
                        (garden (living-room east door))
                        (attic (living-room downstairs ladder))))

(defun describe-path (edge)
  `(there is a ,(caddr edge) going ,(cadr edge) from here.))

(defun describe-paths (location edges)
  (apply #'append (mapcar #'describe-path (cdr (assoc location edges)))))

(defparameter *objects* '(whisky bucket frog chain))
(defparameter *object-locations* '((whisky living-room)
                                   (bucket living-room)
                                   (chain garden)
                                   (frog garden)))
                                
(defun objects-at (loc objs obj-locs)
  (labels ((at-loc-p (obj)
             (eq (cadr (assoc obj obj-locs)) loc)))
    (remove-if-not #'at-loc-p objs)))

(defun describe-objects (loc objs obj-loc)
  (labels ((describe-obj (obj)
            `(you see a ,obj on the floor.)))
    (apply #'append (mapcar #'describe-obj (objects-at loc objs obj-loc)))))

(defparameter *location* 'living-room)

(defun look ()
  (append (describe-location *location* *nodes*)
          (describe-paths *location* *edges*)
          (describe-objects *location* *objects* *object-locations*)))

(defun walk (direction)
  (let ((next (find direction
                    (cdr (assoc *location* *edges*))
                    :key #'cadr)))
    (if next
      (progn (setf *location* (car next))
             (look))
      '(you cannot go that way.))))

(defun pickup (object)
  (cond ((member object (objects-at *location* *objects* *object-locations*))
          (push (list object 'body) *object-locations*)
          `(you are now carring the ,object))
        (t '(you cannot get that.))))

(defun inventory ()
  (cons 'items- (objects-at 'body *objects* *object-locations*)))

; interface
; 6章で実装されたコマンドラインインターフェース部分
(defun game-read ()
  (let ((cmd (read-from-string
              (concatenate 'string "(" (read-line) ")"))))
    (flet ((quote-it (x)
            (list 'quote x)))
      (cons (car cmd) (mapcar #'quote-it (cdr cmd))))))

(defparameter *allowd-commands* '(look walk pickup inventory))
(defun game-eval (sexp)
  (if (member (car sexp) *allowd-commands*)
      (eval sexp)
      '(i do not known that command.)))

(defun tweak-text (lst caps lit)
  (when lst
    (let ((item (car lst))
          (rest (cdr lst)))
      (cond ((eql item #\space)
              (cons item (tweak-text rest caps lit)))
            ((member item '(#\! #\? #\.))
              (cons item (tweak-text rest t lit)))
            (lit
              (cons item (tweak-text rest nil lit)))
            (caps
              (cons (char-upcase item) (tweak-text rest nil lit)))
            (t
              (cons (char-downcase item) (tweak-text rest nil nil)))))))

(defun game-print (lst)
  (princ (coerce (tweak-text (coerce (string-trim "() " (prin1-to-string lst))
                              'list)
                  t
                  nil)
          'string))
  (fresh-line))


; REPL
(defun geme-repl ()
  (loop (game-print (game-eval (game-read)))))

(geme-repl)
; 入力例
; look
; walk west
; pickup chain
; scratch head ; 未知のコマンド
; pickup chiken ; ないオブジェクト
; walk east
; walk upstairs
; inventory
; look
